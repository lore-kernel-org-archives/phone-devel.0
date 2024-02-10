Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01D05F545
	for <phone-devel@vger.kernel.org>; Sat, 10 Feb 2024 19:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707592294; cv=none; b=lYGCqzRd7iuHh96m9G6t5b9GjUQUTnuNpVqNQWUgwg/J41d6rN+jK6PJijduPgKpaGWRNmEmuSzFE7HU6NhSzJRrXS5IbudzsozgNAyKD3293EVPFWG70dtjqAvMUuRUxboQ2jFWhywIvR137KRw5e+Ee9PWz1fkoo+lQa5qfI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707592294; c=relaxed/simple;
	bh=x1GVwGorkcxO3IafmVnsCPl7EfeQZAKgg116i67uWXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sr/DZ6ABcIj/PUJQSxkrosbMiUlGCWx26kKN8fJ+ED5wLjek2UBDvTKlu/cbfFdfrdT2DxGW6H5fDYqVVBPPZf+4OX+Hp3sLCOQztaKkMP6E3NjU7QfUuWKJmK6MZbQt2o+sHZ0NLgwBaqS5IQi0ovSASL3PFwqFg/mZQ3nsE70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Md2XEQjR; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Md2XEQjR"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a38a1a9e2c0so238553166b.3
        for <phone-devel@vger.kernel.org>; Sat, 10 Feb 2024 11:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707592290; x=1708197090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LEw2EnFXzQVU2p0mkCDlT1t0pyChlA/M+u/ewTeLVg8=;
        b=Md2XEQjRapgSam1RkndwtnhBIv3IzIxZbgnC0YMxB+jcEEFtTgf5TE0OMNTSI2JuJo
         racZVqE0L8xlygRZp24y7jq//YWoPoBPRaYJ+f5z5IxexF80XGsw221ofW335/mn03gU
         cXuzf4/pFgkZ+0MpKmW4Srtm/0VJgk6HEG+TQQEK+nthppjoEsczu+0xpoOvV7fea6I7
         VE795PiSP6a2tO/v+Cz9OvDcLlM8LEycyvnJW/phATcQhSIweORRYivp7ZiR/XCTTUnt
         NbkcRLzWO/pTRYo4WS7eHXUasK9bjnUsAukIMYE5BPa9z+9FRl+vcYAzThqt62a9Gqk2
         tOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707592290; x=1708197090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LEw2EnFXzQVU2p0mkCDlT1t0pyChlA/M+u/ewTeLVg8=;
        b=VbWDjQu51ET1jMexY2VOANKG6fg1v24EEaeCBl/TRx48U2zsup6XkaMrQlg/s86/gB
         fJtZ4TZguSow+IYGkS2iX7YeTkm7lAAH99X/Akl70Jf37NbkKNhrltSLQ+O6Vo4/yhU5
         FmwQRfAPoURcJkx/yDnSt9OPz9GhmeOmh15l7GJWJJOww7J995Ffk9MQ+4YMGqARnV8D
         cbD33sTJmLomW/4FcF2rzp/YYHJ9xDiNSkNFZGWMJ5vpzeqgKIoOAYJqEpMKePzQ4Sdj
         PfQ+jSeSwblqP25mIPmyd0zSenBrzfECLgZJe6CxtH6D0fyvr0qG1TN6ejg93HvaHcuE
         VLYA==
X-Forwarded-Encrypted: i=1; AJvYcCXnPxNbXMKUCYtGZigMeL+0Cr4AkESH38XLmOjKfMTrnGe9athdImEmL1a5kryd/Vdct7gwAdiHrjSrvQa90G+IVPatPpWzBm7dwCM=
X-Gm-Message-State: AOJu0Yzn/Dq3NVORqmGNYLeNjzMetOVclsT7vqjmJpsyKynrNFkeIAOD
	1tdNicA6ZeSfp6IUMPfjQmNWZBvtmIPGzMVzscoxV810+A/s825HTCsf66v5JIY=
X-Google-Smtp-Source: AGHT+IFQ1p9zAgzQOUSwl5Ea/XO5538HhUhx2MIaN+c3CTo0bUpLvWYiCGb3EOZeubpmv7KdMb4Lpw==
X-Received: by 2002:a17:906:552:b0:a38:a174:1316 with SMTP id k18-20020a170906055200b00a38a1741316mr1910684eja.72.1707592289981;
        Sat, 10 Feb 2024 11:11:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWiJrRAZbBqUDXJFWpkO0i+fsugtySrXkHVf/nkA66ymTNKN+pAUOFFjIqOwqSQrW4Oo/XrD4oJrk57DYMRjQC+gnbAQEvqZjIIveR9HzZw0qPE8I3EPPVIa2TT+7Di84fhT15I3NWIyknWFqblVVNW213nWW9x4j/KrKlhmx4QHbsMa+cYuiSnJB5MzR49nEC89AC1sIdBOROAko1SAoyG8tJdKkbW3njeLWpbPKKlAGYVsO0oesYed7a16kvV7/FPvplr8xO9Y+ud97ZONsUCfPNRnRcjpcfYiUi4QiDiKennm/kYxlyVZrPue9azFrCtZyn9pa9OsDe+oiu6TUf2nplRKErDDzCFzIKTUWCQJ6vl0vYg95nNyX3Sqb42puIfs6Kw6V6VQPFbf/wd11a54EwCpMGlM6dLQvxx
Received: from [192.168.1.116] (abyl12.neoplus.adsl.tpnet.pl. [83.9.31.12])
        by smtp.gmail.com with ESMTPSA id sf5-20020a1709078a8500b00a3bf0ab3f2bsm1789963ejc.21.2024.02.10.11.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Feb 2024 11:11:29 -0800 (PST)
Message-ID: <9e1d7e08-ed17-4876-91df-f05529184e58@linaro.org>
Date: Sat, 10 Feb 2024 20:11:25 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ARM: dts: qcom: msm8226: Sort and clean up nodes
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Matti_Lehtim=C3=A4ki?=
 <matti.lehtimaki@gmail.com>
References: <20240210-msm8226-cpu-v2-0-5d9cb4c35204@z3ntu.xyz>
 <20240210-msm8226-cpu-v2-2-5d9cb4c35204@z3ntu.xyz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240210-msm8226-cpu-v2-2-5d9cb4c35204@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2/10/24 17:28, Luca Weiss wrote:
> From: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> 
> Quite a few nodes haven't been sorted correctly by reg, so let's do this
> now so that future nodes can be added at the correct place.
> 
> Also at the same time, move the status property last.
> 
> No functional change intended.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> [luca: add more text to commit message]
> Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

Due to the nature of this change, it's hard to thoroughly review,
but nothing screams nuclear breakage, so:

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
