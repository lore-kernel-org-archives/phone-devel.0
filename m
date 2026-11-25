Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.42.129.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635491;
	b=kp4GlnQk2ZdeU0VqmDHPQN7U8CHj1zh3DbxpDTVl7UGNmIA0IUpqDwnO/pIzgLjPUqfu
	 2n+Ty4ItjjaSNOOB8+XP67Ce3WMetIMyo/JelaIuUN5jOW2r8vYm2D2vHKXxymIDh0+kJ
	 xWuyYEW2HBpwBgwUD9ErOgfVIuleO6dmw3zAEiXRd/yGIWDoOU4jnFhu/l+i4oU0tja2d
	 QHO427eLRzEyHsBkohAmxvT1s3c4Ug6bcqfKg0sU8Lg28paqXpZobFz66t7bw19027N/m
	 WAN5X0BRfILH9HZMCl3nqampmHHpvUIQLhHAGZjU1sMzyT9XMba+/Cx9VYGiC9PcZ+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635491;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Spam;
	bh=htE2M1hy7O9Hdwg5xNHQhAuiFErmgHovLFWXKCYuMZQ=;
	b=sHZkBqfoBms92TgQfRKla1xyBQ9bTZRvGY0A6ZHLYbnpAwFqEM/54pQCFiHOUH5Zi4Jp
	 W0OSN6PnDKAX1mxXoU+bLQvmaSB84cjLjylfmWJVMX+Rw/3yEHvYHykBKFTbRX3qTLgRl
	 J8wZQrba/6J/hea7yqeC85O54D+k/SpyKCec3+jLmwDEOznV2vZTVQXInqJNLiDs9RACk
	 WLX7rn8Wb9V3ca17is3ldbOnYfXudoLoVPH5QTidhNAh6E4IknT+vtrKp89DUmeRi0q0Q
	 VaE/LaxHSCO1n5sm+dIl4Vf7eN05G3KxdUglTzFnSbyr9QmcNguIhhRu0xTypOzm/Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ixit.cz;
	spf=pass smtp.mailfrom=ixit.cz;
	dkim=pass header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b=K85IxFFc;
	arc=none smtp.remote-ip=84.42.129.46
Received: from ixit.cz (ixit.cz [84.42.129.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F0F606A31E;
	Wed, 25 Nov 2026 19:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07F0F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b=K85IxFFc
Received: from [IPV6:2a02:830a:f787:8f00:f33c:cbcd:417b:d2b9] (unknown [IPv6:2a02:830a:f787:8f00:f33c:cbcd:417b:d2b9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 63B3453402F5;
	Wed, 25 Nov 2026 20:38:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1795635487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=htE2M1hy7O9Hdwg5xNHQhAuiFErmgHovLFWXKCYuMZQ=;
	b=K85IxFFclHF6FGndLn3SqWflK3X3sMjY3xiKtJZzzZ6woVqUzgeBBdy1izSqa4wycKhkwn
	68xmNOhECQFv5Ovvwfj5PaQJAJQBEY/EhsGDnwMVtRq5ORxxVXs9zwsX9MaVTQTZFpBKIv
	5LotsaFPAk28sfrm7TeqNyHKDhBLrkc=
Message-ID: <222ff97d-2c06-4c84-8234-8495602abbcf@ixit.cz>
Date: Wed, 25 Nov 2026 20:38:07 +0100
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
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Xiaomi Mi 8 family
 compatibles
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260915-dipper-v2-0-cbade54919ee@ixit.cz>
 <20260915-dipper-v2-1-cbade54919ee@ixit.cz>
 <20260917-heavenly-weasel-of-criticism-1add6b@quoll>
 <b324f0b8-0875-457f-936c-89b858d082fa@ixit.cz>
 <0fd3e0a5-33f7-4bc6-9146-dcaf035c3ef5@kernel.org>
Content-Language: en-US, cs-CZ
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <0fd3e0a5-33f7-4bc6-9146-dcaf035c3ef5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam: Yes

On 18/09/2026 10:40, Krzysztof Kozlowski wrote:
> On 17/09/2026 12:25, David Heidelberg wrote:
>> On 17/09/2026 12:21, Krzysztof Kozlowski wrote:
>>> On Tue, Sep 15, 2026 at 04:32:24PM +0200, David Heidelberg wrote:
>>>> +      - description: Xiaomi Mi 8 family
>>>> +        items:
>>>> +          - enum:
>>>> +              - xiaomi,dipper
>>>> +              - xiaomi,equuleus
>>>> +              - xiaomi,ursa
>>>> +          - const: xiaomi,dipper-common
>>>
>>> We do not make "common" compatibles.
>>> git grep common -- Documentation/devicetree/bindings/arm/qcom.yaml
>>
>> TBH I have mental issue with calling it xiaomi,dipper-dipper
>>
>> All three devices are branded as own devices, just based on 99.9% same base.
>>
>> I'm not aware of any internal name which group these devices.
>>
>> I could call it like xiaomi,common, but there is the polaris and beryllium,
>> which aren't "that common" with these three.
>>
>> Do you have idea what to do in this situation?
> 
> Just don't use "common" or "generic" or anything close to it, because it
> confuses future contributors thinking "common" compatible is allowed.
> It's not.
> 
Hello Krzysztof,

since the rest of the generation uses Android codenames, to not complicate 
sdm845 gen, I would stay with these here.

The change would be such as:

        - description: Xiaomi Mi 8 family
          items:
            - enum:
                - xiaomi,dipper
                - xiaomi,equuleus
                - xiaomi,ursa
-          - const: xiaomi,dipper-common
+          - const: xiaomi,mi8-family
            - const: qcom,sdm845


The files like (because the dipper doesn't imply shared base):

-#include "sdm845-xiaomi-dipper-common.dtsi"
+#include "sdm845-xiaomi-mi8-common.dtsi"

firmwares would be:

-       firmware-name = "qcom/sdm845/Xiaomi/dipper/ipa_fws.mbn";
+       firmware-name = "qcom/sdm845/Xiaomi/mi8/ipa_fws.mbn";

but for specific devices inside dipper/equuleus/ursa.

Would be that reasonable from your POV?

Thanks
David
