Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB4113D8BE
	for <phone-devel@vger.kernel.org>; Tue, 23 Apr 2024 17:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713891719; cv=none; b=j0SpxTHgEBJ2MNc2LQcTCygh8M1sB5gg+CQE1qC/3EoqmPJxAOmjeTZnzOV9mDGYLu0X4Vy9GTDmLaIjdY1u8cSjVlkEBUR+Yk8bK68mfALA4oeIASquSr2H2s2V0caC8U6t20H890kjY39D/vSH0ppPjA3zvfegDMXERbCKuP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713891719; c=relaxed/simple;
	bh=cC+dErYbmnokudp3GhDMHIAy+gc8yV+HfdxgXByLeSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fhOXEjLczjIUpG/kQraW1Yykvjdpn4P6EeVRwUTC+1PhkuM10f3/xz1AFYh3Cj9xNwGpZTBqqN0GRpk0RZJDkzekUbNO4WS72ym+hsGfM1/lpvx/aJInRChoS2/nxV8FuidVWRgWCg9ct7wwhnkhaBk4Xje53KKnvFwdOoVOj2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r3n6swNb; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r3n6swNb"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51ae315bb20so4563898e87.1
        for <phone-devel@vger.kernel.org>; Tue, 23 Apr 2024 10:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713891716; x=1714496516; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z9xHbZYIG5Mw8Eh9K4eptlqfJVILD/D23wlU1wrlp58=;
        b=r3n6swNbxTyErIdOJHqK7cJ7IVAu/yw2jzhLaKK6mIt8PBSgA2KJ2ahI4olOgv8oTd
         DzVbBeAOfMvs6OXytFCyTdOsRfZg/WFhhtr+3R3RhhhUOh8bc5/0M5FiuZ0jw/VUc2+1
         wKBk+LPTrfrRbq3KYBdwAqhHvNzlRYw2TJsflB191P6h4Z7fEyUmNn+GZRegXhNpXXs8
         aNpFKKYPkVgfmj1hBHdH19fQKVo4bqcB33CRD1jPcBBCxuCL6t7fIllO0/tH1/qQByba
         c5N9sBC5o3lhfUIlaALjFqbzW8c02QTWZRVa8aW5/Q8kT+Z4XIYet5lw6ptd6UdWNjTy
         QZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713891716; x=1714496516;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z9xHbZYIG5Mw8Eh9K4eptlqfJVILD/D23wlU1wrlp58=;
        b=iIEb9KOffTzw5bqwQAEl1NEaZRmzdadUtXuOlv5G88tGOZnsphrBLR/Pc7JCOaTyC5
         HlU1dCS/+Tbb/t8jMnNMMvEdVOngruRbpSB7xwtjI73wTwrMqHBo6NRrI6m06A8NJ4rr
         QfDob66bYEOtuX9rqKD+rFd5L4zPyiMj5cILqEQOsd7gunI5CJocXt31T6IgKNg5sZAa
         L/mmGS5eoDNW+EKuqcZUdZDo6u8AIEF1wTvGDh81fBhWRjVkOjjQxrpLlvVfueD9dV5j
         3fBfhgZnz1R89Bxd+msC3czcO5f/OWy08C8do+Pb4L8idhbHVNyaGWQxBn2RZrcfLTms
         4Ntw==
X-Gm-Message-State: AOJu0YxO1xCwvs/q4acusRI32Hj4oR7mthImBq7bxyDm3t/eQg1kX+EH
	iZehfBcxyqH4XWdrygQHJ9GAYbVl8GyXHVecF8Ql+eMbHVp72fd++ESIveFtVkk=
X-Google-Smtp-Source: AGHT+IFFgAqRTu0OiAHoCmMWpJsWpTFKQENMZbvbVW68Tnv0kqgDei+xKSGXPHh9KPd5kq4AudXVJA==
X-Received: by 2002:ac2:58cf:0:b0:516:7738:bd5c with SMTP id u15-20020ac258cf000000b005167738bd5cmr102879lfo.4.1713891715686;
        Tue, 23 Apr 2024 10:01:55 -0700 (PDT)
Received: from [172.30.205.0] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id e17-20020ac24e11000000b0051bbb1031dfsm150689lfr.182.2024.04.23.10.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 10:01:55 -0700 (PDT)
Message-ID: <a6936f38-78d8-458b-8864-543a923ad1a1@linaro.org>
Date: Tue, 23 Apr 2024 19:01:51 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: msm8976: Add WCNSS node
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240413170317.34553-1-a39.skl@gmail.com>
 <20240413170317.34553-5-a39.skl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240413170317.34553-5-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/13/24 19:03, Adam Skladowski wrote:
> Add node describing wireless connectivity subsystem.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---

[...]

> +					wcnss_wifi: wifi {
> +						compatible = "qcom,wcnss-wlan";
> +
> +						interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> +							     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
> +						interrupt-names = "tx", "rx";
> +
> +						qcom,smem-states = <&apps_smsm 10>, <&apps_smsm 9>;
> +						qcom,smem-state-names = "tx-enable",
> +									"tx-rings-empty";

Since you're already going to resend, please keep one entry per line,
this fragment is very inconsistent

looks good otherwise

Konrad
