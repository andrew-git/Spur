/*
 * Spur for NME
 *
 * Copyright (c) 2012 Pixel Pounce Pty Ltd
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 * 
 */

package com.pixelpounce.spur.components;
import com.pixelpounce.spur.graphics.SpriteFrame;
import com.pixelpounce.spur.maths.V2;
import com.pixelpounce.spur.graphics.IPosition;

class CSprite extends Component
{

	public var behaviourName(getBehaviour, setBehaviour):String;
	public var currentBehaviourTotalFrames(default, null):Int;
	private var _behaviourName:String;
	public var currentFrame(default,null):Int;
	public var play:Bool;
	public var loop:Bool;
	public var scale:Float;
	public var alpha:Float;
	public var spriteFrame:SpriteFrame;
	public var isLastFrame:Bool;
	public var animationPlayCount:Int;
	private var _positionAdapter:IPosition;

	
	public function new(entity:Int, spriteFrame:SpriteFrame, positionAdapter:IPosition, scale:Float = 1, alpha:Float = 1, play:Bool = true,loop:Bool = false):Void
	{
		super(Type.getClassName(Type.getClass(this)), entity);
		this.loop = loop;
		this.spriteFrame = spriteFrame;
		_positionAdapter = positionAdapter;
		this.scale = scale;
		this.alpha = alpha;
		this.play = play;
		isLastFrame = false;
		currentBehaviourTotalFrames = 0;
		currentFrame = 0;
	}
	
	
	private function setBehaviour(behaviour:String):String
	{
		_behaviourName = behaviour;
		spriteFrame.frameIndex = 0;
		return _behaviourName;
	}
	
	private function getBehaviour():String
	{
		return _behaviourName;
	}

	
	public function getX():Float
	{
		return _positionAdapter.getX();
	}
	
	public function getY():Float
	{
		return _positionAdapter.getY();
	}
	
	public function getAngle():Float
	{
		return _positionAdapter.getAngle();
	}
	
	public function setCurrentBehaviourTotalFrames(length:Int) 
	{
		currentBehaviourTotalFrames = length;
	}
	
	public function setCurrentFrame(frame:Int)
	{
		currentFrame = frame;
	}
	
}