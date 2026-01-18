Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4312147E5
	for <phone-devel@vger.kernel.org>; Sun, 18 Jan 2026 10:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768732031; cv=none; b=hukn3fa0PBUvdmHCXFUXwZCGu3xkwwqiBkkzEg7GLPHcCg5JZc5HC9GBbUvdGboJ6iVktURUh/UCnP0rvKT/1+/kTwrCyuILWzYqGZf3OHEALn5KYbwabeSj5bTY8RWvdsHgM5zr5Rr6SBV+0uwB6DdclX7uOrmVsOGYa+TVpKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768732031; c=relaxed/simple;
	bh=g3v9aNdNytZLZ6rBo2v8ocKbRD+tgP/M2fp0XY9ZWC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o/cYoY8uIVApZ1GvUNALBcdNWQfX0+UG0EuQ2s63dRi95xo/7D+Axe7bcXkDzZ5nw7VsyVPMgjHlsCH1VA65qXkPPd9EzzWUrpFIatlEDk0RXRi6X4SwSZivhC2WrhzUjSjxgp5qJjFGDSKlrVSyj2UWUjzRzSlnbpQu7I/YF1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WisN+iYo; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WisN+iYo"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ee974e230so27968905e9.2
        for <phone-devel@vger.kernel.org>; Sun, 18 Jan 2026 02:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768732029; x=1769336829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2wVayVrE8vfLjDsbFPedYadpWwsg6eC8hmmLmvT9NIU=;
        b=WisN+iYoyZlLt8E6rcLH8jHzINlF5qvyjphoOLJW/ZzznGjOj4lDpJIgfD8XoNA4ot
         xY6IkwkZ9AiJYXPWD6t7fZ2O1DVDnwoXjIbihHmaISUWs+feLk1NJRyvrFU+uhwd7isC
         0tbCJ4Pg/f+39JD0rwu+toacbbI00n2kY76pMm4oKWsTbF8HEuuZmyQfUbP/PEuvbpqx
         mPA4vYNCMybaruxJuKLuHszEGgvetQU5weXT7528KJdFvqYXYg5lplGjoXJgEe/0Mk3f
         zBq1mpNKhDgGnKpuLKME0iRNpjG7aNSwl64zEg2PrdpnJpeR/AYQBacvYVkqNzSFamua
         9eFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768732029; x=1769336829;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2wVayVrE8vfLjDsbFPedYadpWwsg6eC8hmmLmvT9NIU=;
        b=dRY8UK0W/AnZj2GjSSOfAgmDJC2ymZXAv4w0SfNWQkRDIakAtPQuzjBhjXmITja4Z1
         xtQI+c6Ss/d5hUNb4W6KQ555RAT1CxC7e6dD20N+piIGN8rT9alQbV2PGerVYNpySgqA
         cQm1LrZDwYZmf9r+yejGAMr2DbtdjBLVjGM7Pfvm7NZHBm9uOhdc7ZHcm+GOKP47f5aO
         yNuxz9/x+mDCu+kgMgTXyUVWqv+3ekvd8VIvZ0+5J5LHIkf9vIST//RluRCN/Dy0h6HS
         WrhayUZnf9gbJipDgnOGxflMpqZ9rJalCz9TN4Rzqg+aSHhHiyPU/zeVKoc7MlguykSP
         1eCw==
X-Forwarded-Encrypted: i=1; AJvYcCX9DzTYIyznMZb3TYVR7SWXvCrlDR4l/lnzsqDnsE7JZFt7+XPszl43rQGye38tSuZDBmSwu52wT5lGKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1NP3hiE/8CzAktPds5dvTflKMNGdYCsswnV//MvMJSmDW5KrS
	jR7ymZlCVRnN+Krmve+FqIarb8/pKxIlZO3qrdbeuBHFIgIDPos6Noz9TfM9NlQ+9S8=
X-Gm-Gg: AY/fxX4BmjGs0+Lpy7H+HaHsRvDHfg+vDiU0JUD7oB4mJYMvNjY6PJF3VHOgpznEnWv
	a5xGZdmCaUlkg2S75+6u3MjUrymEWIHJcwMrG5UzWij1xpKvuzP3tcJcgYly/IsY2/KlezEp+0t
	BIK6hsuw/WmPlrc3sUQ10OXJGxA4A/WLINJeHsTFbyaNHDYfiISYWZuCJ284bKj+viRlTkLN1Ox
	zPd2dB/+jC5DX8+wPrl7b93ntBzXdLCORhcapTPAzOGZZycOLsjBNkbn2hNmcHd1h/frmJwqqt3
	999UkAymTPinJV1fPxAdF/z6CCPU5Ok8LhNDpVr1PW16igXwoMP5CK2ZYkPDwJ9gh8zLDYVxCp5
	IQMIOgJUn9zA7FnHBvtcvcUSKYbZNqBcWtQ3PQyAg8IBXEK8+lWaHVXoWgFvvLcnspSNDwTP72m
	5d3TWNoZk1MvnrvYidCPl5B62rHPUHR0oojxAk003rH5VNXnafm0qPYovrM/sts5k=
X-Received: by 2002:a05:600c:8714:b0:479:3a86:dc1c with SMTP id 5b1f17b1804b1-4801e3531c2mr111870855e9.36.1768732028854;
        Sun, 18 Jan 2026 02:27:08 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f428acae8sm190955195e9.4.2026.01.18.02.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 02:27:08 -0800 (PST)
Message-ID: <fdf976a3-d386-40ac-99f9-5d6d1a175677@linaro.org>
Date: Sun, 18 Jan 2026 10:27:05 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] media: qcom: camss: csiphy-3ph: Add Gen2 v1.1 MIPI
 CSI-2 CPHY init
To: David Heidelberg <david@ixit.cz>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz>
 <20260117-qcom-cphy-v3-5-8ce76a06f7db@ixit.cz>
 <4936947b-f402-4817-acf7-299abbeeb23b@linaro.org>
 <010df7e2-ea01-4b32-ae4f-40bff3ad278b@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <010df7e2-ea01-4b32-ae4f-40bff3ad278b@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/01/2026 09:51, David Heidelberg wrote:
>>
>> If checkpatch.pl doesn't complain about it, I think it probably should.
>>
>> Please standardise the location of the comment and have one for the 
>> CPHY and one for the DPHY configs.
> 
> Then I can rather replace the else with elseif (== DPHY) and make the 
> comment irrelevant. What is your recommendation?
> 
> David>

I think the code is pretty self-documenting without a comment.

---
bod
