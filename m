Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB22434C818;
	Tue, 10 Feb 2026 10:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770720684; cv=none; b=DK/M717UUPp7Che9cOHpE1gcD0T/O7lFJqLkchVxS+kSYH8YETnPBL/S1zpMJY8vDvSZ/2NrlbaUzMLfGtKawW+zLvoqmbhjLoEw+3ToPY9HDdm65rJEc5Roq66471vuKqc/bsiW90kxGtnAdKdj/0Mea5tGLyA/eEYvQen1MR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770720684; c=relaxed/simple;
	bh=NTDQ2z46qy9D3IuLQd4Soj1UA8t+QmePoMymLDLGHS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GNlV2FIVPiEsUrNgbWayYySXP056vRNB/S6ZwWK8MPQZ67EbO/t9jWKGWQoPWrrHfS9TPXtUkddYt2RuzAqthHzz6pK+0tdtpLiscj4pt4y6recXQEfnhRXEBiD5kXRLibPXspDbs6ngSgM3zG41WYJ321BgRknyKPQAAMNKSJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ORI+W7xI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ORI+W7xI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770720681;
	bh=NTDQ2z46qy9D3IuLQd4Soj1UA8t+QmePoMymLDLGHS0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ORI+W7xILBNUuSSdr6XQ7zospIplxBB0gAiCi+7j+WjOg6OirC5t7D+Xl5O7l6U0P
	 0HD2maqTImAwLwopKSirmVOZeShM031FZYVVgpHLke/6jK4BxMMu0ps9IYJAiVU7mJ
	 DPkI4/W6XVDRMh6+5pcME+ypELxTR7UpIOY675gyM5/WE4WjDlffajsjni8nZUuueR
	 XxgTBnTkrlvPFnk/DRWWENPmDN+lmWYtu9LWEMdMIEYX+QtAP5kHqaevrVTBqCC3ku
	 tUTykaPPeNV8WofuxZySz/BeOHrhszS0BTziiskZQVZeGt1ORhiYtOxaHAmvupeBWQ
	 n1OUnnD1am5mQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9846417E012E;
	Tue, 10 Feb 2026 11:51:20 +0100 (CET)
Message-ID: <296b000c-5970-4668-bd42-b99ca78d598f@collabora.com>
Date: Tue, 10 Feb 2026 11:51:20 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: mfd: syscon: Add mt8516-syscfg
To: Luca Weiss <luca@lucaweiss.eu>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, phone-devel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260206-mt8516-syscfg-syscon-v1-0-96dcb37acdb4@lucaweiss.eu>
 <20260206-mt8516-syscfg-syscon-v1-1-96dcb37acdb4@lucaweiss.eu>
 <20260207-tricky-strange-swan-6f11b0@quoll>
 <3476c51b-9293-40f1-8b5c-9ac9802d7d97@collabora.com>
 <f1e1eeea-b246-42c8-84c9-0c1203706ddc@lucaweiss.eu>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <f1e1eeea-b246-42c8-84c9-0c1203706ddc@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 09/02/26 21:45, Luca Weiss ha scritto:
> Hi AngeloGioacchino,
> 
> On 09-02-2026 12:34, AngeloGioacchino Del Regno wrote:
>> Il 07/02/26 11:51, Krzysztof Kozlowski ha scritto:
>>> On Fri, Feb 06, 2026 at 11:20:48AM +0100, Luca Weiss wrote:
>>>> Document the Mediatek mt8516-syscfg.
>>>
>>> Which is what? What is syscfg block?
>>>
>>
>> Not sure this is really a SYSCFG block.
>>
>> This should be a GPIO controller range, which is split between IOCFG and EINT.
>> Now, the legacy drivers are declaring the EINT iospace in the pinctrl node, and
>> getting the GPIO controller (IOCFG) iospace from a regmap.
>>
>> I don't have any board with MT8516... but well, the really-right-thing to do
>> would be to migrate that SoC off of the legacy driver, to the new-style one
>> that *properly* takes two iospaces:
>> "base" -> (0x10005000)
>> "eint" -> (0x1000b000)
>>
>> Luca, if you've got such a board, could you please try to migrate this SoC out
>> of the improper (but working good) driver and bindings?
>>
>> If not... well, I think this block is IOCFG, not SYSCFG...
> 
> Thanks for the suggestions. This is essentially my first Mediatek patch and while 
> I'd say I have a good understanding of Qualcomm SoCs, Mediatek is very different, 
> so I've got no clue about anything here really ;)
> 
> I'll try to decipher your comment and see what I can do about it, hopefully soon. 
> Thanks!
> 

Oh, okay. You want to check mt6795.dtsi - that's a SoC that has "more or less" the
same generation of GPIO Controller IP as MT8516.

Also, useless to say, drivers/pinctrl/mediatek ... there's a pinctrl-moore and a
pinctrl-paris; your SoC *should* be paris, but I don't really know - you want to
definitely check if the register layout matches between the old-legacy-deprecated
driver and the Paris IP.

Check a bit; should you have any question, either reply here or shoot me an email,
I'll do anything I can (though probably with late replies, as I'm usually a bit
busy with work - but no worries about disturbing in any way!) to clarify things
for you.

Cheers,
Angelo

> Regards
> Luca
> 
>>
>> Cheers,
>> Angelo
>>
>>>>
>>>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>>>> ---
>>>>   Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/ 
>>>> Documentation/devicetree/bindings/mfd/syscon.yaml
>>>> index e57add2bacd3..a67699f1faee 100644
>>>> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
>>>> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
>>>> @@ -91,6 +91,7 @@ select:
>>>>             - mediatek,mt8135-pctl-b-syscfg
>>>>             - mediatek,mt8173-pctl-a-syscfg
>>>>             - mediatek,mt8365-syscfg
>>>> +          - mediatek,mt8516-syscfg
>>>
>>> Why aren't you placing it with all others mediatek,mt8516 syscons?
>>>
>>> Why this is so generically called "syscfg", completely not looking like
>>> a real name from datasheet unlike the others in this device.
>>>
>>> You have entire commit msg to explain that.
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
>>
> 
