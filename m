Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AB4364CC
	for <phone-devel@vger.kernel.org>; Wed, 24 Jan 2024 12:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706099567; cv=none; b=QCyWXugcseumtmELrnpF1VDiTOA7HvoGWMmLPezklt+bj18PwDvqwhWGp0fLtBB8vnXV84WSivJlnSDjPYjwdQmIo27JL6u7pUAYOdQz/ceiHPhz0fHyuAR5W7/QVxf/nTJURf372/hrqKBXnAnblt7MqUWVHZRrDRgItOdcKGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706099567; c=relaxed/simple;
	bh=gW4Q5dgcJo/w+lcQ9ZV1dV+kkIgRmsKKEjic8VggVWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=goOWjTIRIs4NXyi+OalFU6RsKsVs2MPlGqCfYtMQZaIi+npsDt36/Bcnnb2Fgdevoq5wzurtSgS+itJqgaCSnGSzrxHsWK3E1MS3mV2wXAUe/rk3+ZumLoDkjHmaGHt2oTZ8HJhoz5dFcAaR4eNSZ0EhP/2qGFIDBq4TCx+nFCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QiJkpf6h; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QiJkpf6h"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5100c3f7df1so1767491e87.0
        for <phone-devel@vger.kernel.org>; Wed, 24 Jan 2024 04:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706099564; x=1706704364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AqPAahlzSVSD7Radk/ZPw7KMkRpgnqXYTwyUoIGu6qs=;
        b=QiJkpf6hKlWSGHEc8sNBx6i9B7QRKGtjJXdkKpSF1M/Pmk3csbtRUk13KIqK+sQmCV
         j2pHvwyeK1QSnXa8p962V3b6133eN35oftBUJ5QSBh1vJJGYlVSi8cdor0WdULfObRjD
         ccHG8fx4nlnz6wi8/ssLIFy5QpxpgA80ZFpsQT5hRHeW1KLaw5kvZO/TZx7jphXHT935
         VWb/bTsF6G/RAvvVxciq3+DXkrQxUbdrIb4SrJ7Q4TTSujbGO/99rNJXGEUODmAcSgQQ
         T3urwoxsDJR/5TAJYhMZxyFHoDQiOnip5Cfo968KnGN1nwlO0g1r0TMxX3L8V5C0u5cD
         jtkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706099564; x=1706704364;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AqPAahlzSVSD7Radk/ZPw7KMkRpgnqXYTwyUoIGu6qs=;
        b=qvthASeczHpKLaWW+J6ElbYVid02KRqwy2ED5w6sap3kYI4x53+lVGdVKVvZpdyJTM
         edRqqo8mMQW9jYlWCz9l94aGifYi4YBu0ANws+vnLvcINOzvsLvPoJaFXuIEYS98wzDy
         X7RxegnBXlY2p+Js2ttoGCvfcil+UzivNVAbkrmW3Ld/44CvTWzLkI7D/Bow/o2Skjqg
         EmfbnrMsdMUnJrEoD1zoJ7M4sNZ/fmwY4eFifxcDpCEb9W2Yr4IoBJdljc1ik3BhJSTi
         8G1SQUgglLCIgFCvSm7cEGlXNamu+RvlQOYR+F41lQbSDyzhyOJGiaiuZiM55YhKKg3Q
         oy2g==
X-Gm-Message-State: AOJu0YwWnga0ozqDRySBHnedZCPDpUn7TEacWN0mlXb+usGvBH2kFZtr
	y1tvBzHibqBYi8WsaoRudT8IBIcRqum3Bcz3rqSVpeonvuRsUne5DeAhFj+verg=
X-Google-Smtp-Source: AGHT+IFrTFWo9bWEH+c+SGSHh0D6uNxjEvNOgfsn42ra3rVSTjZMGwHmL9WzsduGBjgSsmB+M8qQBw==
X-Received: by 2002:a05:6512:110d:b0:50e:504e:6c34 with SMTP id l13-20020a056512110d00b0050e504e6c34mr4557809lfg.3.1706099564366;
        Wed, 24 Jan 2024 04:32:44 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id p26-20020a19f01a000000b005100ed58b76sm207756lfc.308.2024.01.24.04.32.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 04:32:44 -0800 (PST)
Message-ID: <bbd011b2-a17e-4310-8b9b-aa58defbe6e6@linaro.org>
Date: Wed, 24 Jan 2024 13:32:43 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8953: add reset for display
 subsystem
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>
References: <20240123-msm8953-mdss-reset-v1-0-bb8c6d3ce897@z3ntu.xyz>
 <20240123-msm8953-mdss-reset-v1-3-bb8c6d3ce897@z3ntu.xyz>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240123-msm8953-mdss-reset-v1-3-bb8c6d3ce897@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/23/24 22:03, Luca Weiss wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> With this reset we can avoid situations like IRQ storms from DSI host
> before it even started probing (because boot-loader left DSI IRQs on).
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
