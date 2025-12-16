Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CB17080E
	for <phone-devel@vger.kernel.org>; Tue, 16 Dec 2025 01:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765847421; cv=none; b=T1diICTIzJFfUZXGnZS+2YqnXRXLO1HuFW4DH3dB2h2ACYpuwYgla5dWZdAquNWq0Q7Sfj0pZjkadc0dN5unMnmKZQAu2Zjqu+HKBoASLJ0R/oEX0GLwyskr9tcHfNAF5dZBQ9BSYtXX4dQTM8Jr8tp/E+e2aL0snJ9GGwKIsWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765847421; c=relaxed/simple;
	bh=WIZ9jyFswOPNqTgsmJJ76iM6G7nvLeuDuP7DQJ6BNqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AXpfBIrUJblnrmkUPPab2XioCnX3QHlJ/vwqH9brFxclLApY0kGd9/PbULqxYoCKNxrpATWX4mdH66kPcktpHRNbUP9arNZiTHrSWUVyaoF/xM1m+/SwLQx4KJWlLI53krIOLd4HWRO7GXagOHE8iTdl3bMkFzA8sM5YYj4wOg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VT0cj1O2; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VT0cj1O2"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-37b960d8aeaso4251181fa.2
        for <phone-devel@vger.kernel.org>; Mon, 15 Dec 2025 17:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765847416; x=1766452216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mi8Xm0zurhbSPDMlN1uc/lNI9yNMPSviozpqbJTiEDg=;
        b=VT0cj1O2UIktLIzkUNpdWYDS3SfInrhRY5mNJcIKLeUAXCKRnfwbUflVWjr+5L2m2h
         8+WWCWRbStWVXcptD5tJdnwvuPsKkW2Zv/oNskRQqBqrVJcIZCJykx7PPQtFsuRcpYTC
         XlwVQvCvmiX4uFLJe9LYi6QIQP17gPaVn5nij71NEtk3tU8dPxKwX7ywJKMmeq7vX2c5
         an1OKKnE4LnMcyB7y2AS0t17BU4sGHiS3J86NELr8jdlU8bP/slS1Uf6EhzZd7YfUNjf
         btpfWx78MnxCnndLDhszNUTO+JqoG0mtIRqBu2tD+pydRZ9BaEoC/JnMoDgLv/61iISN
         W/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765847416; x=1766452216;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mi8Xm0zurhbSPDMlN1uc/lNI9yNMPSviozpqbJTiEDg=;
        b=SshXklk8NP9Mji9EwwA3aG5RQ21AcOIIbJBOQ2mTcqd2NdDbaUwK8r6Wipy+o0n/SV
         Ty6idxIxWe5v4BbB1h7ktJWFoI2tCITBSVm2Yxg2vx1oJD7jFFFd9NlcFgXL5OMcUcRc
         AiARr0N4Kn6kWEannw4SncsKgdoVCqgOFOCOTAfl0riy675INi+AdBkOWnVVfgD/helg
         /HPKRwVO5uf6x7lu8BICcYIbO7FI3XNO90DB1cTNGB1eQ6VMNO7YM9v7+FG5SENPdm93
         uqhDW40y638hYHNIa9KNWRHd0OBBt1mT+oEHHFE25bdr+xo5hPF0Duo3VlWfEEILf6eC
         gS8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8Yp/mkg39j0tE2FlyNLB1B2wuasLIDgtEd+7jOewgAqBRXSyaZW1DROyfUy2tXgkcnO6TZw4ehxc3hw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfzVxsIwAxNbNZazRxQFJwQCbXrbAcsMQRoBNknAzlqJYfNfll
	fpszOo5F8LuJJVe1Hid1D8P/9pPT7269PsAj5G9X9JaPMVIKTgC+K34RsZYk9SZoKfs=
X-Gm-Gg: AY/fxX4C0g8nVZKl82uJplmQ2MaojFa9VsFE3i3qr29gXyJmKEjGn/xwtlDKa9QwuB3
	M1RoudmbmdodOUY++NNgmqcuLPZOxgTH/nSKDkM55I1ua0QZa2FXqk9i6THEj2PqhoSbqAtsIxg
	VmCrqQiYWwloCOckFxTL5+ON9zwVx13NLxCQ7tTXa5x1cRuDU2Clh806d8QwHIhZ+i0HJ3agUMi
	+XI8EYAzkwMYmBqx2dUH7IB9t/VduehZOAdzjUEMu6RIrw520/RCjgmGLK4qtKL0//6rTUtBdUA
	HTKTRQ1EmJLBDyk+feM599/7EMri0xtqroCs7GXgk8ScG5Nh1Ut4CxfJN3Oz042ZwFXexUbmo6X
	kNW5AcHp+Bn9XluJcD3jcOvu+OYVMZCFMxDKhsspyrLwL4pnIH28URrQdBuiw8wVcHKS2nUNDpF
	yug4RHYApT8Qq7V17iQKzhrxNR3rIOC/gDQBiDTMUc+SuC6tzTJd5iUySKKDu2G+6Iaw==
X-Google-Smtp-Source: AGHT+IH7lvZQh/tJdyvFMjmv5Z9sx5r76i24YJXdpQwBw46WC2pR2Mr05q/RbbpGbzcBzScS/lkVsA==
X-Received: by 2002:a05:651c:2223:b0:37a:8acb:a053 with SMTP id 38308e7fff4ca-37fd088227dmr17398471fa.8.1765847416234;
        Mon, 15 Dec 2025 17:10:16 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fdebe61e2sm33946831fa.7.2025.12.15.17.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 17:10:14 -0800 (PST)
Message-ID: <9d78a741-2cc4-4622-8c4d-a096521ca08a@linaro.org>
Date: Tue, 16 Dec 2025 03:10:13 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: Correct camss VDDA PLL supply
 description
To: David Heidelberg <david@ixit.cz>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>,
 Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251212-docs-camss-fixes-v1-1-5c011505ff59@ixit.cz>
 <1e09a93a-d42f-4a23-b346-9f158a60d8aa@linaro.org>
 <b9b84317-a392-4f1e-aa8f-351e92c678a1@ixit.cz>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <b9b84317-a392-4f1e-aa8f-351e92c678a1@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/14/25 11:35, David Heidelberg wrote:
> On 14/12/2025 01:04, Vladimir Zapolskiy wrote:
>> On 12/13/25 00:55, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Usually, the supply is around 1.2 V, not 1.8 V. Rather remove mention of
>>> voltage from the description.
>>>
>>> Fixes: 849139d46d09 ("media: dt-bindings: media: camss: Fixup vdda
>>> regulator descriptions sdm845")
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>> Added only Fixes tag for the initial commit, not all the copy-paste
>>> propagated ones.
>>
>> Generally it should be possible to specify a list of Fixes: tags.
>>
>> However, despite the change is the proper one, there is an opinion that
>> Fixes
>> tags are not applicable to dt bindings with a given reason that only
>> executed
>> code can be fixed. So you may be asked to remove even a single Fixes tag.
>>
>>>    Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml  | 2 +-
>>>    Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml   | 2 +-
>>>    Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml | 2 +-
>>>    Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml   | 2 +-
>>>    Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml   | 2 +-
>>>    Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml   | 2 +-
>>>    6 files changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-
>>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-
>>> camss.yaml
>>> index 019caa2b09c32..9009cfe993d75 100644
>>> --- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
>>> +++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
>>> @@ -130,7 +130,7 @@ properties:
>>>      vdda-pll-supply:
>>>        description:
>>> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
>>> +      Phandle to regulator supply to PHY refclk pll block.
>>>      ports:
>>>        $ref: /schemas/graph.yaml#/properties/ports
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-
>>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-
>>> camss.yaml
>>> index ee35e3bc97ffd..cb922f90fe900 100644
>>> --- a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
>>> +++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
>>> @@ -129,7 +129,7 @@ properties:
>>>      vdda-pll-supply:
>>>        description:
>>> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
>>> +      Phandle to regulator supply to PHY refclk pll block.
>>>      ports:
>>>        $ref: /schemas/graph.yaml#/properties/ports
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sc8280xp-
>>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc8280xp-
>>> camss.yaml
>>> index c99fe4106eee9..2231d7216f62a 100644
>>> --- a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
>>> +++ b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
>>> @@ -268,7 +268,7 @@ properties:
>>>      vdda-pll-supply:
>>>        description:
>>> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
>>> +      Phandle to regulator supply to PHY refclk pll block.
>>>    required:
>>>      - clock-names
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-
>>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-
>>> camss.yaml
>>> index 35c40fe223767..8e6ca94c88695 100644
>>> --- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
>>> +++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
>>> @@ -95,7 +95,7 @@ properties:
>>>      vdda-pll-supply:
>>>        description:
>>> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
>>> +      Phandle to regulator supply to PHY refclk pll block.
>>>      ports:
>>>        $ref: /schemas/graph.yaml#/properties/ports
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-
>>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-
>>> camss.yaml
>>> index 82bf4689d3300..d50e096b900db 100644
>>> --- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
>>> +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
>>> @@ -211,7 +211,7 @@ properties:
>>>      vdda-pll-supply:
>>>        description:
>>> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
>>> +      Phandle to regulator supply to PHY refclk pll block.
>>>    required:
>>>      - clock-names
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-
>>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-
>>> camss.yaml
>>> index ebf68ff4ab961..ccd2d024bfd10 100644
>>> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
>>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
>>> @@ -300,7 +300,7 @@ properties:
>>>      vdda-pll-supply:
>>>        description:
>>> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
>>> +      Phandle to regulator supply to PHY refclk pll block.
>>>    required:
>>>      - clock-names
>>>
>>
>> As for the change itself it is good, I'd prefer to get a correction
>> to 1.2V in the documentation rather than a complete removal though.
> 
> What I'm seeing, while the vdda-pll is usually close to 1.2V, it seems
> to me that's not everytime the case.
> 
> Can you confirm it should be exactly 1.2V, if yes, I'll clarify it in
> next version.
> 

This info can be obtained by checking "vdda-pll-supply" supplies of CAMSS,
which are set in upstream device tree nodes right at the moment across
various Qualcomm SoCs, as well it can be verified against downstream.

The naming (and the descriptions above also) "vdda-pll-supply" itself
is non-informative, I hope that in future there will be only clear supply
names like found in qcom,x1e80100-camss.yaml, qcom,qcm2290-camss.yaml and
qcom,sm8650-camss.yaml

>> In any case,
>>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>
> 

-- 
Best wishes,
Vladimir
