Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8CA390DB7
	for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 16:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766161142; cv=none; b=XzbOZA8OQOSx/v/7priXPm+91YCWVPdlCY0mtqlOsp/QWosyX2yi3nuWgenhPVVPJ1RLa+JNqLRmvvUUrn0/2hJ083hUMLWz2McIRvWGbC/x7KPpYFw4tbuXUAWNxSz9JWq0voqSW8A6KYwFshHLNpemFeyVrwu9mLHO77ngLZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766161142; c=relaxed/simple;
	bh=76McvnfT1vgXqcmj5nLToKdiSaYoQdSKm0XytE77Gg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gugF1TWZZQNzMa8y7hG+xtQSESI2QCdHFAICcc+0nLXWgy1olfyODxQ90KKvUT9qZ6R+wevPXgeVn9JfgTerqs+HRNjrl+5HsO6ruDh/JOQJKQgcWtWIAm4hyZ2PkuYOeSCJuDY6g8PYv1hwKSTAw3TYh5vA9mljBcWg0t7lM1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KzfCMohl; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KzfCMohl"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-597c418b79eso133913e87.2
        for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 08:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766161138; x=1766765938; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X/Hi71EFMwbT8ptNwXW/+PuikNBEe+nI+EX1MWn7rrc=;
        b=KzfCMohluoFutBJeB+siIcTTjLp9eupIKWdc6piLhDQHCmm04hQMdqAxuYH7tMz4xA
         p5TVLapzwt3prWDVYqKNmXCtf0JWnzwU8VcCrke2HNZOOre4mrZ5l47z55u3m3+Xn77b
         GY6cq3NV2xHFxKUW3XNPTOqhnzGte6FFvaUBWTwzqDnpkmUNc8VQzX6IFdoUI2tj9owN
         96eNkT/w1sMzNuQQM+uDf98hYU29Tzo3op/X6+MfYxxfAbv5sXlgF47eRSp7fG1/SvVn
         KfwF/DW8Vidin1MexpMBs2WNp88yTVt0ypmUi9D7njC0DYfnwbhvR3W32T7WkQvluR44
         YnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766161138; x=1766765938;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/Hi71EFMwbT8ptNwXW/+PuikNBEe+nI+EX1MWn7rrc=;
        b=oVQoLHYE3DaCjOp/ALJeBk82E9/O0J9TGxkhq0O01gSbkpjW7camR1MM4IdjTs9F0E
         HgIJ2xu36lhuwxJcHXdE7to+aVn9CSnFTeNulURbw6P1NH7yGkIKY7rrCgkILZmOfQw4
         3MqrrtM6Rp2yjZGNz+GZsnwlf10Stk4LzecffiCjIxeKop/knEOVZHBPEdOdR6pD+Qoq
         LjBTegHkc2LggqGjn2iF54CZZDeyTxDn8Z8jepwebWJJyI01cnxJCwHF44Vpdjgzhi1W
         ++oRRE7cXj97DnHL2/WNMehIP31i3PAqERq2d6h1Qi9Z29dEUOR6BG9dSIM5D1owcJy3
         cqbA==
X-Forwarded-Encrypted: i=1; AJvYcCXwQygM6RQG8/vaF9SuHBjGPvAawQIYD5b416g5A8zF3ec0WfQ9reKCSPRd8sKst8rYYJhAdk6Wd7Oppw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs1XmwXx3T+UL6Y9Lr37IFmUkaXrhWi8eV7570dCiZZirm4p5g
	aCzmEGGF8GOE+KJGO/dbqb5jLuvuwamGEpFl4peNTf4gGxnI7MKxXgVXsjJOwcSz2Ls=
X-Gm-Gg: AY/fxX4hwxWy2rpHlpyxvVp6+vJhNmzw6r1YDa5GhttZQy2UFW8/sUecN/Vf9lgDXH7
	tNYEUMEOa4FLv4eF91tZZnF5WOsTO8vquwF8+819Fr678pogTZbKjBt4+YBQVpvTel8PkCpqvg6
	3A03wAL8o5MhXplxkF4eeb5ivAfY33Mtey0BumLcpdEvA2dmqHw5Fq9rM9K1B3Lw+BRUA0QFcia
	DRDVRba5adl5S9OHST0imqZTHmqSxPAL5TYjSKv0d7RG+i4rOKvf+ALLODde6l/P3mBAAmupII9
	OV9u3o3RSE8D19b9smEyI7tKKj3Xsd/RaMaKwupekLCqZXu1wq5Su5PVxxpX/4GrOu6A31zaqqY
	RweX0hthMRApD/iybeb4Rd091KBWu175Do5IIpzvH6ekH6Xt2AryID1rp7cwjKXH8kBSZq667dy
	aZ06up32DcJZ9anpV/p0FhTKgc4DGfOXNqry1pk/HNHlAXuZhrpbKGi10KSWzHu+NrAQ==
X-Google-Smtp-Source: AGHT+IGGG9s0wXtoxGsq0U0Depu7p7I9nYSz8VthyzwNRgLyv2wgLeIEplXVM9vmQjg7e233jqdPoA==
X-Received: by 2002:a05:6512:3d91:b0:57e:ed2d:190f with SMTP id 2adb3069b0e04-59a17d96fa9mr709065e87.7.1766161137426;
        Fri, 19 Dec 2025 08:18:57 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5ef1sm795622e87.2.2025.12.19.08.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 08:18:57 -0800 (PST)
Message-ID: <2ae1a0a3-b105-4c0d-abbc-4b9d708b0272@linaro.org>
Date: Fri, 19 Dec 2025 18:18:49 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com>
 <20251114-sm6350-camss-v2-1-d1ff67da33b6@fairphone.com>
 <de7ad562-80bc-498e-a6fb-cc26bb6343f0@linaro.org>
 <r6EgtiSu8pqs2ouFERTw7fx8kYZ3RcSbGklwd17UPxNGGd3sbRDl2BPyplkABZVu3qyfrIzRMisa0qTSrm89BA==@protonmail.internalid>
 <DE8FV81S45S5.CH6K1QAX940D@fairphone.com>
 <a428f8b9-c338-4404-8dc1-da6daae37d5c@kernel.org>
 <d7dfeb7e-c0b2-426e-8572-023715c33674@linaro.org>
 <272d039c-25a0-4db5-96a3-c28907882cd2@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <272d039c-25a0-4db5-96a3-c28907882cd2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/16/25 16:05, Bryan O'Donoghue wrote:
> On 14/11/2025 17:06, Vladimir Zapolskiy wrote:
>> On 11/14/25 18:09, Bryan O'Donoghue wrote:
>>> On 14/11/2025 13:06, Luca Weiss wrote:
>>>> Hi Vladimir,
>>>>
>>>> On Fri Nov 14, 2025 at 1:40 PM CET, Vladimir Zapolskiy wrote:
>>>>> Hi Luca.
>>>>>
>>>>> On 11/14/25 13:15, Luca Weiss wrote:
>>>>>> Add bindings for the Camera Subsystem on the SM6350 SoC.
>>>>>>
>>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>>> ---
>>>>>>      .../bindings/media/qcom,sm6350-camss.yaml          | 349 ++++++
>>>>>> +++++++++++++++
>>>>>>      1 file changed, 349 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm6350-
>>>>>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm6350-
>>>>>> camss.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..d812b5b50c05
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
>>>>>> @@ -0,0 +1,349 @@
>>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id: http://devicetree.org/schemas/media/qcom,sm6350-camss.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: Qualcomm SM6350 Camera Subsystem (CAMSS)
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Luca Weiss <luca.weiss@fairphone.com>
>>>>>> +
>>>>>> +description:
>>>>>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm
>>>>>> platforms.
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: qcom,sm6350-camss
>>>>>> +
>>>>>> +  reg:
>>>>>> +    maxItems: 12
>>>>>> +
>>>>>> +  reg-names:
>>>>>> +    items:
>>>>>> +      - const: csid0
>>>>>> +      - const: csid1
>>>>>> +      - const: csid2
>>>>>> +      - const: csid_lite
>>>>>> +      - const: csiphy0
>>>>>> +      - const: csiphy1
>>>>>> +      - const: csiphy2
>>>>>> +      - const: csiphy3
>>>>>> +      - const: vfe0
>>>>>> +      - const: vfe1
>>>>>> +      - const: vfe2
>>>>>> +      - const: vfe_lite
>>>>>> +
>>>>>> +  clocks:
>>>>>> +    maxItems: 30
>>>>>> +
>>>>>> +  clock-names:
>>>>>> +    items:
>>>>>> +      - const: cam_ahb_clk
>>>>>> +      - const: cam_axi
>>>>>> +      - const: soc_ahb
>>>>>> +      - const: camnoc_axi
>>>>>> +      - const: core_ahb
>>>>>> +      - const: cpas_ahb
>>>>>> +      - const: csiphy0
>>>>>> +      - const: csiphy0_timer
>>>>>> +      - const: csiphy1
>>>>>> +      - const: csiphy1_timer
>>>>>> +      - const: csiphy2
>>>>>> +      - const: csiphy2_timer
>>>>>> +      - const: csiphy3
>>>>>> +      - const: csiphy3_timer
>>>>>> +      - const: slow_ahb_src
>>>>>> +      - const: vfe0_axi
>>>>>> +      - const: vfe0
>>>>>> +      - const: vfe0_cphy_rx
>>>>>> +      - const: vfe0_csid
>>>>>> +      - const: vfe1_axi
>>>>>> +      - const: vfe1
>>>>>> +      - const: vfe1_cphy_rx
>>>>>> +      - const: vfe1_csid
>>>>>> +      - const: vfe2_axi
>>>>>> +      - const: vfe2
>>>>>> +      - const: vfe2_cphy_rx
>>>>>> +      - const: vfe2_csid
>>>>>> +      - const: vfe_lite
>>>>>> +      - const: vfe_lite_cphy_rx
>>>>>> +      - const: vfe_lite_csid
>>>>>
>>>>> The sorting order of this list does not follow the sorting order
>>>>> accepted
>>>>> in the past.
>>>>
>>>> What file should I best reference?
>>>
>>> Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
>>>
>>>>>
>>>>> I'm very sorry for the vagueness, but I can not pronounce the accepted
>>>>> sorting order name, because it triggers people.
>>>>>
>>>>>> +
>>>>>> +  interrupts:
>>>>>> +    maxItems: 12
>>>>>> +
>>>>>> +  interrupt-names:
>>>>>> +    items:
>>>>>> +      - const: csid0
>>>>>> +      - const: csid1
>>>>>> +      - const: csid2
>>>>>> +      - const: csid_lite
>>>>>> +      - const: csiphy0
>>>>>> +      - const: csiphy1
>>>>>> +      - const: csiphy2
>>>>>> +      - const: csiphy3
>>>>>> +      - const: vfe0
>>>>>> +      - const: vfe1
>>>>>> +      - const: vfe2
>>>>>> +      - const: vfe_lite
>>>>>> +
>>>>>> +  interconnects:
>>>>>> +    maxItems: 4
>>>>>> +
>>>>>> +  interconnect-names:
>>>>>> +    items:
>>>>>> +      - const: ahb
>>>>>> +      - const: hf_mnoc
>>>>>> +      - const: sf_mnoc
>>>>>> +      - const: sf_icp_mnoc
>>>>>
>>>>> Please remove sf_mnoc and sf_icp_mnoc, they are not needed for enabling
>>>>> IP to produce raw images, and one day you may use them somewhere else.
>>>>
>>>> Ack, will give it a try.
>>>
>>> Disagree with this.
>>>
>>> See the Kanaapali patches. I'm asking new submissions to be as complete
>>> as possible, instead of limiting the hardware description to the RDI.
>>>
>>> So listing the ICP noc is the right thing to do.
>>>
>>> So please include register banks for
>>>
>>> - bps
>>> - cdm
>>> - icp
>>> - ipe
>>> - jpeg
>>> - lrme
>>
>> This suggests to get a DT backward compatibility lock forever,
> 
> I'm not entirely sure what this comment means.
> 
> The objective here is to get a full and complete DT describing camera
> hardware that can be consumed by
> 
> - CAMSS RDI
> - CAMSS RDI + future goodness

Here the problem is manifested, there is no even a raw idea of "future
goodness" and how it looks like practically.

Hardware can be represented in DT in many ways, why one arbitrary chosen,
and never tested or even verified for correctness, representation is
selected over any other one?

Let's start from the beginning, why putting everything into one unstructured
pile is better than accurate splitting of various CAMSS IPs into own
device tree nodes? Downstream has different device tree nodes layout,
why is it worse, should it be expected that Qualcomm in downstream moves
to a "better" proposed layout of device tree nodes for CAMSS or only
upstream Linux shall suffer?

Somebody said that there is an idea for "future goodness" to modularize
CAMSS, did it change?

> - FreeBSD
> - Any other DT consumer of upstream data perhaps even CamX

FreeBSD or CamX are software, and they shall be excluded from consideration.

There shall be no guesses about software usage, the only concern is if
the hardware desription in the shape of device tree nodes is proper or not.

Partial verifiable description is a proper description, and adding unknowns
of "future goodness" does not serve any reasonable technical purpose, it
adds an illusion of a proper description only, and it was proven that this
illision shatters even for CAMSS, see CAMSS CSIPHY case, when a wrong DT
choice can not be undone anymore for legacy platforms. It is good to acquire
an ability to learn from the past.

Everything can be added ad-hoc while keeping the hardware description in
a proper and correct state.

-- 
Best wishes,
Vladimir
