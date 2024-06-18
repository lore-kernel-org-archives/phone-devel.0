Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D79179641
	for <phone-devel@vger.kernel.org>; Tue, 18 Jun 2024 14:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718719588; cv=none; b=jrQ6RvMYcFkLthr/Bwjjb14YwqiWBWYUnZXpAy16whdpTa+D6NLaaOMeLChD+oxr0d+DgZUbmG5rLY7nJvjTCWDnyR7sypTydP3MWoMZ7qcVuXEZgRvVf0yBbCmXsIaEJzMalczEElBpJO/hrcwOruswMDGTrGCpbgFh/tBgfVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718719588; c=relaxed/simple;
	bh=7hLqheXnE9W0qWhH3a25KKsYl8gJBb+w+/flsviwYBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nugzj1RoHm28aH9C+tvgvDUamUGTTtk1f8S/GGOGI9cxCqxeqXpZskmFHLaVgpd6bWQL7ZT44NJcBONqsxr1ahv4BPzIwMM7fpwre/1LBvam3a6lHzN27q2ckVOqQ4sEDncA56OHLboORaUiYghoDM4szVOeAqu5AITva1+by/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xgk1EWoC; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xgk1EWoC"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52c82101407so9113857e87.3
        for <phone-devel@vger.kernel.org>; Tue, 18 Jun 2024 07:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718719584; x=1719324384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+So+e4AIxy5W1wf2KjSmogFgzVVYZd75IixT8YReE44=;
        b=xgk1EWoCl8tP+E8X1Y51Wk3TJv5r3RQI0LzQ7SWU2G9qHwThPnaWunvGD6RBjFYKD9
         YCaNmldQu6vttxm7XSDmDx0A8qEWy3tSlYi1CpF7wnd1EnHFasUbo0jVn8fQPEeORloR
         q1t3pkpYGH2Xm3rp2XF/EDrQjH+x+p/wz0XzDbtLZmY40W6yObCFGOQQAE050mVoLqKX
         WAAPtlt3cGGI3n9WpfVfsw3IHwDv/rkur7ogqoAlmhzpJQRpmbOgiUiDppAMH+j8pdZp
         RmeIUxq7hmrsazEqaV3dkomjFpkyCuPyMWYGkqWY4cedEKxmT/HvRK8JMasJgNi3rs0s
         ldxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718719584; x=1719324384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+So+e4AIxy5W1wf2KjSmogFgzVVYZd75IixT8YReE44=;
        b=Za9awgHxJ7XQblE2SlrnuuLdVa+330V6nKuHuO5PayacXRD4gBFodCCwr/gtjGhKwZ
         xGujXXTyXq+OS6pn/sH7XQiBE46Xw3NXZa2YjJnN3AukHWZuhS0PF7pggX8fJY1mnGlq
         V0DCHiHRUuGTgOVxf/yZqWFPJz2ocMUOgpiJVFbGJ5xjtOHLWOYlE2bz1KXfRa3irgKr
         uarYHWRRIiirLI3ycNhSRayZCKF2hToYmGjUfwRcpQLr7iOvWIeO6Rsbmk925kEYpRZt
         BZC772ibOf9FjS8hvqcV1m4bqBsZSfYcz7Rg9/f4k24tM1HhOhZ6pO5T4dqHYxVUFZWS
         XudA==
X-Forwarded-Encrypted: i=1; AJvYcCWKeNbBj3mBzjhS20M9wqSNy8llfAf7XblYE/GPgBiMiS6gCvcN9IHYhbrA09weaObt0Mbu7s3Dy0nSZWmWrsyQIl4a31poLYl1J9Y=
X-Gm-Message-State: AOJu0YxSwMlDhRuRpcRKdEvRQJtGgsFs6IglnODZvcllwKMVRmhZjwr0
	EcXmseC029r5bJlXCgP47AjVtH8EFsE/ZDebtUjY/4OonZFnU4rbhQbht7Kh4sQ=
X-Google-Smtp-Source: AGHT+IGY5kISvhIt6rGqgfv/SlC1aIqmQbwMlMYxf3oPhg19EaPl7J618YwZRjbodQ1Ardwyi8neOw==
X-Received: by 2002:ac2:44a2:0:b0:52c:a5cc:27e7 with SMTP id 2adb3069b0e04-52ca6e9dafcmr9013751e87.66.1718719584220;
        Tue, 18 Jun 2024 07:06:24 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca287ad4fsm1536033e87.201.2024.06.18.07.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 07:06:23 -0700 (PDT)
Message-ID: <31921e1d-da7f-4846-9d69-4e27d61cb464@linaro.org>
Date: Tue, 18 Jun 2024 16:06:07 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/23] arm64: dts: qcom: starqltechn: remove wifi
To: Dzmitry Sankouski <dsankouski@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 phone-devel@vger.kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-20-e3f6662017ac@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-20-e3f6662017ac@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/18/24 15:59, Dzmitry Sankouski wrote:
> Starqltechn has broadcom chip for wifi, so sdm845 wifi part
> can be disabled.
> 
> Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
