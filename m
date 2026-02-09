Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662502DEA90;
	Mon,  9 Feb 2026 20:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770669911; cv=none; b=pqbqyXgmGhx+IOOWlq8jzLGxy+6hUK/eP5o8t0OiWRzHbdyjAjMsgIGLUge3BxbVRKg3Ww4LnZi6+EG+/WBm79RJYU7UDMsdaGrjzNBw3iNN+X06LLBAulfMCXb5TirpL2R6Tm5BvOIkc8EgVsHlQptyHkKcXqaciq+AJljoQDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770669911; c=relaxed/simple;
	bh=X1KoYVWiFzc4LQ9pm/nSofVmkz5/jQqXAxNpYaTQpY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LD+mQrQTIkJLdmQtmw0RRTdqIi9wRP3e/j5J+eeM/RnMj/KQCHMoo1j9z3lbKgJ2YU6OoStq41TwcJ+YPVnRsCzs4oWUgb4fHEAce2FnpN4tQlF/NHrRqetjx5tU+mrldz8Bu9ulttmgSeD0KtJ6gHZTIU0z77dUNehSgT2YArc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=Hkhez5OF; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="Hkhez5OF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1770669903; bh=X1KoYVWiFzc4LQ9pm/nSofVmkz5/jQqXAxNpYaTQpY0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Hkhez5OFJmafMQqdFooicOHR1EURW5jV13zxJlmjqppX1LWXKLK8EDkLz0cab9gAK
	 iziuxyddAP+fugq+3yJ2kvrobIP5zZIiWcQ8cy3abjJMbJep1lTaWUB+Kr3h5SNwP0
	 cChQXag+NqE3hVRDJRMrU1UelfvDakwsfpl/wSXU=
Message-ID: <f1e1eeea-b246-42c8-84c9-0c1203706ddc@lucaweiss.eu>
Date: Mon, 9 Feb 2026 21:45:02 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: mfd: syscon: Add mt8516-syscfg
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
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
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <3476c51b-9293-40f1-8b5c-9ac9802d7d97@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi AngeloGioacchino,

On 09-02-2026 12:34, AngeloGioacchino Del Regno wrote:
> Il 07/02/26 11:51, Krzysztof Kozlowski ha scritto:
>> On Fri, Feb 06, 2026 at 11:20:48AM +0100, Luca Weiss wrote:
>>> Document the Mediatek mt8516-syscfg.
>>
>> Which is what? What is syscfg block?
>>
> 
> Not sure this is really a SYSCFG block.
> 
> This should be a GPIO controller range, which is split between IOCFG and 
> EINT.
> Now, the legacy drivers are declaring the EINT iospace in the pinctrl 
> node, and
> getting the GPIO controller (IOCFG) iospace from a regmap.
> 
> I don't have any board with MT8516... but well, the really-right-thing 
> to do
> would be to migrate that SoC off of the legacy driver, to the new-style one
> that *properly* takes two iospaces:
> "base" -> (0x10005000)
> "eint" -> (0x1000b000)
> 
> Luca, if you've got such a board, could you please try to migrate this 
> SoC out
> of the improper (but working good) driver and bindings?
> 
> If not... well, I think this block is IOCFG, not SYSCFG...

Thanks for the suggestions. This is essentially my first Mediatek patch 
and while I'd say I have a good understanding of Qualcomm SoCs, Mediatek 
is very different, so I've got no clue about anything here really ;)

I'll try to decipher your comment and see what I can do about it, 
hopefully soon. Thanks!

Regards
Luca

> 
> Cheers,
> Angelo
> 
>>>
>>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>>> ---
>>>   Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/ 
>>> Documentation/devicetree/bindings/mfd/syscon.yaml
>>> index e57add2bacd3..a67699f1faee 100644
>>> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
>>> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
>>> @@ -91,6 +91,7 @@ select:
>>>             - mediatek,mt8135-pctl-b-syscfg
>>>             - mediatek,mt8173-pctl-a-syscfg
>>>             - mediatek,mt8365-syscfg
>>> +          - mediatek,mt8516-syscfg
>>
>> Why aren't you placing it with all others mediatek,mt8516 syscons?
>>
>> Why this is so generically called "syscfg", completely not looking like
>> a real name from datasheet unlike the others in this device.
>>
>> You have entire commit msg to explain that.
>>
>> Best regards,
>> Krzysztof
>>
> 
> 

