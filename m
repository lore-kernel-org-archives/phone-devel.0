Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=37.187.26.192
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674228;
	b=J0fI8iLAD4SQfFG0KQ1ORla5Q45Ba0CgvWFaYvZt05yKVpowF43ieLgVQlYjMY2DhBQ0
	 OvFBhQG76XBclKE8BVYZ5cqSPNqEN0i7SnktCYFOnR14STw1WRIq/bxNbY7++6URSHlES
	 DbocOdcUcg4042HvvsA1gMCEA3d2EtcZ6ojy16jbMda6vbmzZ0jXKEhJzcf6yLU8OzvmC
	 gDZAiAhi23baW5I59NDtSFVdR8feaqqaZboCPO++ca/FwpEwE1le+tjhSiQlR18yUp05w
	 feONrdu9Vv2i0IUv5IpVTvKLW43sdyu4H4dDkHY4GQMPwUVl6l6vR4jGDqWYbgpM05A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674228;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=qehpt+5wAFo/jceSmPTcsq2gcp2uvoZ5ZH7hEYBOSHs=;
	b=d37tLcOkkoblzDRG9Li+fqbY0ZTYMUogfWYtt+PZoq1fj+O+3J1MgzPlIakTKGqajoSH
	 ge6/xjxTgJEQc0ngV3JGVmnxGkPMz+C4doEChTeIzccGHomCsckCo+/hLHt7bPDT9x8yO
	 6OG/Y+PbFYYr7nD7X8yHSHPlMYGjNd7J0aeQpswWiBdt7h5iwxmh9cdWbPGFPyKrNNtOy
	 tjh7GmvHDDmQpZNk+NuAeoEEzh023PreXWWQE8A2QAO1ALvUm13aEuRA0iEBUjlU5wIaj
	 AtFVz/H9CtM5bmqrPxQ2LGUvonsOfmWYWwoHcbbmuszJYvp7SoD6Y4GoX4xc0vtd9Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=adishatz.org;
	spf=pass smtp.mailfrom=adishatz.org;
	dkim=pass header.d=adishatz.org header.i=@adishatz.org header.a=rsa-sha256 header.s=mail header.b=lirZne51;
	arc=none smtp.remote-ip=37.187.26.192
Received: from adishatz.org (ns314768.ip-37-187-26.eu [37.187.26.192])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD68C606A31C;
	Thu, 26 Nov 2026 06:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD68C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adishatz.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adishatz.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=adishatz.org header.i=@adishatz.org header.a=rsa-sha256 header.s=mail header.b=lirZne51
Received: from [10.42.0.216] (123.127.95.79.rev.sfr.net [79.95.127.123])
	by adishatz.org (Postfix) with ESMTPSA id 0AB0F4C0163;
	Thu, 26 Nov 2026 07:23:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adishatz.org;
	s=mail; t=1795674217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qehpt+5wAFo/jceSmPTcsq2gcp2uvoZ5ZH7hEYBOSHs=;
	b=lirZne51Z6mkF1RxbO2r6CCcVAlpNn7K+z+OjT/Xhzl9aBQn6xIJQkaVNk7eg987PZDwmK
	aN0hPknPt1T/7uiLPzOI5FmoNYtWUgOG5b88zffb05VJMWj60oufFu0cGXYP5k5bu79vW1
	D1bhzgTo9BWnDGpxvPxNQop0jZRz7S5kuCn+4CL34xYB1ZSDM/9+HAgBsoEwxfsM0gY1bC
	k3cxe/c2xPPgaT7WXJ3c2Ct68GIWaHe3MJxFPqxKM72diGxgFawM95nHK2zjOeWVmg1pfp
	C2SEEPoaGYQ8u8t3zoKAZr9luBq4f3wyQQZOwjH2sU+PZr78cPdD4SYYYzHePA==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=cedric.bellegarde smtp.mailfrom=cedric.bellegarde@adishatz.org
Message-ID: <7e748fc5-43d1-4200-9ad4-45d43d659e47@adishatz.org>
Date: Thu, 26 Nov 2026 07:23:32 +0100
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: v4l2-async: link ancillary device runtime PM to
 the sensor's
Content-Language: en-US, fr-FR
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hans@jjverkuil.nl>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20260922-sensors_pm-v1-1-05adf2098b5e@adishatz.org>
 <arNzDkG8JmIWedwF@kekkonen.localdomain>
 <179014670130.2497080.16248724869350735374@ping.linuxembedded.co.uk>
 <arZX1fhR_hvg0nfM@kekkonen.localdomain>
From: =?UTF-8?Q?C=C3=A9dric_Bellegarde?= <cedric.bellegarde@adishatz.org>
In-Reply-To: <arZX1fhR_hvg0nfM@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

Le 25/09/2026 à 13:15, Sakari Ailus a écrit :
> Hi Kieran,
> 
> On Wed, Sep 23, 2026 at 07:58:21AM +0100, Kieran Bingham wrote:
>> Quoting Sakari Ailus (2026-09-23 07:34:54)
>>> Hi C�dric,
>>>
>>> On Tue, Sep 22, 2026 at 09:39:12PM +0200, C�dric Bellegarde wrote:
>>>> When a sensor's fwnode references an ancillary lens or flash device
>>>> (e.g. via the "lens-focus" or "flash-leds" properties),
>>>> v4l2_async_create_ancillary_links() already creates a media controller
>>>> link between the two entities, but their runtime PM states remain
>>>> independent.
>>>>
>>>> This is a problem for devices such as VCM lens actuators, which are
>>>> typically spring-loaded: holding a position away from the spring's
>>>> rest point requires continuous power, and the position is not retained
>>>> once power is cut. If such an actuator is allowed to runtime-suspend
>>>> independently of the sensor, the lens can drift back to its rest
>>>> position during an otherwise active capture session.
>>>>
>>>> Add V4L2_SUBDEV_FL_PM_LINK to allow an ancillary subdevice to request
>>>> that its runtime PM state be linked to the associated sensor.
>>>
>>> Interesting idea.
>>>
>>> The IPU bridge has created such a device link between the VCM and the
>>> sensor as on some ACPI systems the VCM is in fact relying on the power
>>> resources of the sensor. But to do this everywhere?
>>
>> Same on any Raspberry Pi camera module. The VCM is powered by the same
>> enable lines as the Sensor there I think which has made things
>> interesting in handling VCMs for those devices.
> 
> Yes, this has been an issue in DT for a long time. :-( I'm not sure if this
> approach could extend into a solution for that though.
> 
>>
>>
>>> VCMs traditionally have been powered through opening their sub-device node
>>> and that hasn't been exactly neat API-wise. It has been practical still,
>>> AFAIK, as in order to control the VCM, you have to have a sub-device node
>>> open.
>>
>> This is an issue though, as libcamera opens the device nodes and holds
>> the file descriptor when it has a camera. This means that even if the
>> camera isn't streaming, the VCM is powered on and causes power
>> consumption on mobile devices which people then attribute to pipewire.
> 
> A practical fix for that could be to set the current to 0 when streaming is
> off.

For the zero-current route: lens subdevs have no s_stream, so how would 
the VCM driver learn that streaming stopped? The device link gets this 
from sensor runtime PM without a new API.

>>
>>   
>>> This change also does mean that if the sensor is powered, even for
>>> always-on use cases that generally consume very little power, the VCM is
>>> powered on as well. VCMs still typically consume very little power if the
>>
>> Do you foresee use cases where a linked VCM shouldn't be  powered while
>> a camera is streaming? That effectively means the lens position seen by
>> the camera is 'arbitrary' / undefined ?
> 
> It's neither, in that case the lens will be just in the resting position
> which is typically close to infinite.

>>
>>> current is configured to zero. Maybe this won't be an issue? Backtracking
>>> from such a change wouldn't be simple, and might not be possible at all.
>>>
>>> There wouldn't be a need for a sub-device flag and this would be done for
>>> all VCMs based on the ancillary link.
>>>
>>> I wonder what others think.
>>>
>>> Cc Laurent and Hans as well.
>>
>> Cc Dave too as he's looked at similar things in the past.
> 
regards,

-- 
Cédric Bellegarde
