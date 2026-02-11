Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB9F3570B2
	for <phone-devel@vger.kernel.org>; Wed, 11 Feb 2026 10:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770804471; cv=none; b=F7IgmSTJ5BcJ6hg1bQJYHThB9V0HjyR7c3Ik19XqLJjNhufsyKi/eMKHSiMU/TVVDUI/bW0cbbXEpCz1yE9dR7aa/CkPw2RrhCw+QJxWxZK9xD78fcUI0tYB3EbtQFX+hmmgWQSM3HhZDUtXgt7UQcww3qxSGJ9pG7Qhe0U8z/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770804471; c=relaxed/simple;
	bh=Z/GZBqQCmQqhyUddNtRKYVJhCP5a/7Enct9wdD8/d5o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=f5jkNDxO/q2h2GyRG1xFTP40BsEjBpV9l4811kDFjz8vUNieMzCOqgs85y5GDXXk9ZBXSBMxmhHziKS5NKJ59uilJKECq9Uc6JaSsqP1Fei5SVdg6T33rJt/3bDfZhzw7MAszARs5qZNVwyNCKAvzZmzNbw1cW++uBFwleyXtck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXT/v1WS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXT/v1WS"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48336a6e932so22563245e9.3
        for <phone-devel@vger.kernel.org>; Wed, 11 Feb 2026 02:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770804468; x=1771409268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DBJ0NKlYQHSTcX5I6AxqwzGVfI3Ct5XxPEslgPpmVnc=;
        b=eXT/v1WSL5Zz3bFDNqpQsuLgfHFORzAM5e6JQCrZgRQjBP1E5oZHSGzAAjsLo3F6Bs
         7dvRSOfVdhqMIsYskNnh6b+bH07uwfMmPtAwa+A4bHkDLITdmTKPCyZ9a8mU73+KN+41
         LDP/3TRNGjVNiMfoWl1D4nhqiw+qZNjNv4+p1CbDMgYZHs6+2sBflZqSQqNMi/zI6Adl
         syBOzAvFYxkeMXiRQtr+LfzXsVtegLzX3mABmseNuaiXMysBVqOGpCfGOa5ksA3BkBK2
         lnzZGeHvJLohoo1p6zWR+2BDuDUAxaGtBynzMyYDs/w/lQHQonndcr8dHGWqz2mBgETd
         4amw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770804468; x=1771409268;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DBJ0NKlYQHSTcX5I6AxqwzGVfI3Ct5XxPEslgPpmVnc=;
        b=wFQ0MZcm4bgrcpEujtX69LvfbGHRtb0o33Vss9xdreVxalKlVvi580tyWJrsLwUwV1
         9vYRwKy6Qhyd7+/LyDGtOD9/08agT9vJy3B37RTzcHPMrj7n+mZjWkcmBLhCNbulLgIK
         gqM5MQVmO6SLnfwlDCTBcgo18eM3rORm1RQjIwRxI0gen/Tex4kBfYgzfAWR3wVPg7RR
         vRqSM77tXZ9QABxCaHI6xHWk9mTMhaYRRrRsNNG/FaB1XPAWcaBbbk+syCFMH3mjjnvv
         HwWeIbdhaaQUOeLSGefglBv1xfTIHA8up+5DhO9cgllkkOxG0v6UPhkwMLQbM9oLgmqQ
         0a4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXG+tSs444Vxb/zs2t0xixugiFEQjzkGS73ytyYM6diR8/NSMMPymcGG1D4r0Ob4f0cBS94AfXWewo6CA==@vger.kernel.org
X-Gm-Message-State: AOJu0YytwuuMC+Pb1+nsf6ygFqe4OC2Qyv6dqueFcsZQh0TrN52No1P5
	zvDD8ZnZEJuve3KwCu7tL5/6NQYGSQaG5w/fYhohUCps0tMN6VSGG21Z
X-Gm-Gg: AZuq6aK4Y/Q5Eu+3DNrGaxCUwPvaheJFVZs49DgYC91sBp/Ds63OIvEiLJQf+dtxh1v
	8jN7xD6D7jJyp3GVw7M8EyZUb4rmBygJCbFIVrvg9v9xyM0BQpa0JvqJG5Rq0O0AosyHwf6TARi
	sX45r60KaSYGICr9yjDCo3ciTs46E4HXWrHocvxJmEmm3sA+1NH/tbSKAzSnKt2bxCK/CjK8n99
	9tzx8MpZoGZ3MLIljROfYF1+89bywwF7HYzw+CZHZR9TqLbI4s78ULNP8tFv8aG4zpUAq5R8JRc
	bCspq6FEQqHiXhu0Zuuq+1KTMmU/KrtxkKAnDXteDvK0Cu6WQLSBhq4nK+zJxnhgUQT1vz/7qfh
	0LkB4JJ7N2rTZQmLWr2ukn6SqUmH8Kff8VxmogP3OTw6ByU2ZwYunkZXvkmXBaLvh7wrrNb8WE9
	NJKHeVnCXOSRyimC/ZQeIseB6xKxx8XWiskTVz5UVm6O4CXD9HLTO9f4fkiEy1SNCAflJo
X-Received: by 2002:a05:600c:5288:b0:47d:403e:4eaf with SMTP id 5b1f17b1804b1-4835b90c34emr27593875e9.10.1770804468157;
        Wed, 11 Feb 2026 02:07:48 -0800 (PST)
Received: from ?IPV6:2a00:f502:160:28bc:50b:5000:8e7d:e760? ([2a00:f502:160:28bc:50b:5000:8e7d:e760])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835a5c7c4csm55048775e9.0.2026.02.11.02.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 02:07:47 -0800 (PST)
Message-ID: <b95d7a49-6191-4d85-b725-4a941505b40d@gmail.com>
Date: Wed, 11 Feb 2026 12:07:45 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: iio: light: vcnl4000: add Capella
 CM36686 and CM36672P
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260210-cm36686-v1-0-aef68dd46ad4@gmail.com>
 <20260210-cm36686-v1-1-aef68dd46ad4@gmail.com>
 <20260211-sceptical-frog-of-revolution-fc3cf4@quoll>
Content-Language: en-US
In-Reply-To: <20260211-sceptical-frog-of-revolution-fc3cf4@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/11/26 8:49 AM, Krzysztof Kozlowski wrote:
> 
> There was CM36686 v1 and v2, so I do not understand versioning here.
> Also, lack of any changelog.
> 
> And how is it supposed to work for us? Try yourself:
> 
>   $ b4 diff 20260210-cm36686-v1-1-aef68dd46ad4@gmail.com
>   Could not find lower series to compare against.
> 
> Please implement previous feedback.
> 
> Best regards,
> Krzysztof
> 

Since I am making changes to the existing driver instead of creating a new one,
I introduced a new patch series. As I mentioned in the cover letter, cm36686 is
fully compatible with vcnl4040, so instead of creating a new binding, I create a
fallback compatible for the device. I probably should have named this patch
series something else.
As for the previous feedback, I added the subject prefix and removed the
redundant phrasing.
