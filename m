Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB5836655B
	for <phone-devel@vger.kernel.org>; Thu,  7 May 2026 12:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158019; cv=none; b=UdFJRmzehIf0ZFzUJ0Dx57T/zNp6xgTZRqs1dfpbqXs6au1CzV+DSzvObaYXoeiu4deFo3mTJdWdZnLkHPVWQyiyMbTtavDrHbjePB6rf+niKlGS7Jv8/idLr2ADK8r2FrYfdGlkXkegICcV9YMljHh/CA/DgnFYIr0iVfrH4zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158019; c=relaxed/simple;
	bh=LsNPzTYb4vC/IRp9aPkuk17mGNMZ2iBsyvpkcKxGmAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e8qm3wR24WnV/XnZ1de8Hy193VpzDfwwKDp9wrXZUeMHq5UKyeJFUbuSQlWzste4vxjpDIdlpQsSvUaGfzG1gXcaTM8aWdgP3hWVTn5W4oI2FMoHOi9Zhiw7jSmUrfIHx8ucOBeu6yA1C2T7eQhIt8Z9Ydvfw4Gb9qRUhoYM68o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khRdqhCB; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khRdqhCB"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-65c396d3b36so732931d50.0
        for <phone-devel@vger.kernel.org>; Thu, 07 May 2026 05:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778158015; x=1778762815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iqpck66QhRsxNb0AyaQYMFfCYd0FYECyWms2Js1iBwA=;
        b=khRdqhCBafqTwjkbsQBn9aig8F1i7BnjorBwmCPfuM/v7waJLlT8fzHFSn2AsXeYM/
         vo8m6B4r0/0EcIQUHxZp8kUnmhHuQyQ0qMw9SeVtQizMsHLZDfWluPXEuGFTs/0wAyvZ
         o/o5Ngw6g7XazWVgPSvU+sMSS21k/KDmsS0V3j1wpZXpM2MCMsD5arjgtak3D2FSiqXI
         77vJXPZtC/zbZr8OSrRRlKB6IjyxocUQRoI+hRYJ2zC/2XIbXMpdXRlFst9eZVA0VmCx
         dMJhtmK8Yb0B/9o+gmFEQTKIf5nbX3i6/0F9urKmQ1NY0HzjD6WR4PC8Yxr31Su7NaAP
         msWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778158015; x=1778762815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqpck66QhRsxNb0AyaQYMFfCYd0FYECyWms2Js1iBwA=;
        b=rRrotWT6OK+p8UDXXA62kcUWvWwBoTHNO7cv0hjvaJ2sMGkEquf0gWgcamGuR/9ls1
         fvtENwZQAEavlEf9QMMY3XkmBNQNV2JwW4QJ9SD4SzSfZ0NgVDpZN6uI4ChjZ2I6d0BK
         j8Z3zbfAKhE9IzumDAVjfOvVt05LqOcs78CM0W00d2TNtxFbGzE2NznpJ6ltkQhcyUnG
         wVYnGSjVdTkoACXnq+6AJkk2YzLfkrw15Ha5dCsIdceDvwh9b2RN3GaKHptPaqE4yV1H
         99MspzepMK2LN72lVRQQqDlhxZFBUurAGRMHCOrb83Nv491IZxBENGMRnuTsIWnXnJdx
         qvsQ==
X-Forwarded-Encrypted: i=1; AFNElJ92I/OtIjOKw69Fhew9FZ0cFWjhqSAx43VA7F1updYDRM2QCr+Oz9QJtmhzTyURY0PS2QMgSkMNwqrqzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQsB9qaqiP8TcfNiq4XaioM+p0vAibtr5N3/9pPApoAf/lp+ht
	TGXlYFs3r2VEZvutkwx26YKlCklzq14xBPlXg2oCrF1rLEZcemT454ov
X-Gm-Gg: Acq92OEpkzUHAc2oDD18H5ye3OFZWEKTW44IserNDTZp8dQtZb6zAkYmSrs5zvteJes
	ZAgWx8diuy19ZZna3QKVB54mO8JS/hbBxL04UXaILhczOE6BqzFl/yLox77C5rtgldNu7avDoP/
	cFhGNPg1rP5A2ExVi20T2YF6wjWfuBqu/3TjclmCp8PYiVq1vITFhvSLutft9vUwHPMXRjGo47B
	c5LiboLQBYBcj8dMrAPENLTaXFSk9TeztyxwniOWmgUOqV3xcNT6VzdSLRQKD05EId9P4Uhgth6
	j/vGwCAmFC8py27ILDLK8r9VSTGwnHDZ6C2eaNtsVOiwi9yl7YC1z1Ouqw6+uDirx0otOw7LhCG
	7hma+Vq2ntdNtZI0XP1ZZx85sKeYriSqooe9/jtKuCafB+U8CpEQsun1pFSXl2cfhj0FTXRF/T0
	D4QE8A5OhCzlMPvQP2CCJpB0xBMK52kKU8P3Ik
X-Received: by 2002:a05:690e:d05:b0:64c:9f31:e33 with SMTP id 956f58d0204a3-65c79a23920mr7669550d50.65.1778158014778;
        Thu, 07 May 2026 05:46:54 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65c7abf5e11sm2468850d50.0.2026.05.07.05.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 05:46:54 -0700 (PDT)
Message-ID: <18998766-62fe-4a5e-95d8-1bfae712d8fb@gmail.com>
Date: Thu, 7 May 2026 15:46:48 +0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
 <f5TsKnC12rLsH63vAi01aN4oXUFLrfgIhn14IQFDb9gcac6anLzzhJdkGNdQ2dRs4vYbFKUptfEgWuKdgIgGsQ==@protonmail.internalid>
 <20260507-msm8939-venus-rfc-v5-5-d7b5ea2ce591@gmail.com>
 <17c4626e-8926-4cad-842d-a1b171d1e962@kernel.org>
 <CYaHtccGOWlaUtl3QIKva44ybJiRHsPOZmHEkl2KKGmnDxJ8vTH-SVNMGbL7bjkYjI692nplORzOhpfjs3XJfg==@protonmail.internalid>
 <4f1ab5b8-3bfe-43a6-8b91-317456188544@gmail.com>
 <7df3bff7-b872-4b20-8e7c-698157a41f33@kernel.org>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <7df3bff7-b872-4b20-8e7c-698157a41f33@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> Try:
> 
> v4l2-ctl --verbose --set-fmt-video-
> out=width=1280,height=720,pixelformat=NV12 --set-selection-output
> target=crop,top=0,left=0,width=1280,height=720 --set-fmt-
> video=pixelformat=H264 --stream-mmap --stream-out-mmap --stream-from=/
> media/cyclists_1280x720_92frames.yuv --stream-to=/tmp/
> cyclists_1280x720_92frames.h264 -d /dev/video1
> 
> v4l2-ctl --verbose --set-fmt-video-
> out=width=1280,height=720,pixelformat=NV12 --set-selection-output
> target=crop,top=0,left=0,width=1280,height=720 --set-fmt-
> video=pixelformat=HEVC --stream-mmap --stream-out-mmap --stream-from=/
> media/cyclists_1280x720_92frames.yuv --stream-to=/tmp/
> cyclists_1280x720_92frames.hevc -d /dev/video1
> 
Sorry, but I couldn't find the file you were referring to. Do you happen
to have a link where I could download it? Thank you in advance.
> ---
> bod

