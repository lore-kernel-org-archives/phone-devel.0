Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2165920CCDC
	for <phone-devel@vger.kernel.org>; Fri, 14 Nov 2025 15:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763135970; cv=none; b=hKf0WeiubBkqTmty8qrEwH2+NYMcvc3HCSJ+RJj/ekHgvr0QvYSDotCCtKjT+yWKJ/iG6ekaMbhFfTC+bx5f8rsKQ2VXd9SMQAev5Tbr0yIGdpSBxNAsJhbzYnxuzyNv3fJoZCL+yEU918+DKwhJGJ+JhhKxWkbK+MD209SwOBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763135970; c=relaxed/simple;
	bh=yXgFpiaxg0LZlcZZHrI9y6mWIPy0APOxvyrLswjcxuo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=o43mTsoL2Sj150MXWCMgmamEwY8Lvwg9o2ng9LtrslgljeTiCsYNszMSpcvSRMnwWELf/1AsUCUj/dsSqkniThbfZRS+KGef0u4bpi9Aa/eOgeRyjjA2YtAZFLlGc4cWouHCBRbb8wErGfIli8nWfpTB/YFSSbeDR7GwxAwU6EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=oJ88zzv/; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="oJ88zzv/"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b472842981fso269794166b.1
        for <phone-devel@vger.kernel.org>; Fri, 14 Nov 2025 07:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1763135966; x=1763740766; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXgFpiaxg0LZlcZZHrI9y6mWIPy0APOxvyrLswjcxuo=;
        b=oJ88zzv/L6p11dI3kq9GolQii0X1LIitDEiGab06zALjLLGcKy/2pUt/AiIdWcBaj+
         t7LeXLBj4WKebtmH1wfCs2K8ap4pH/IMSIChyi3vpYe6K5JR1TRwTG6hyyhjdHvirNlL
         JzEpC4dUzprfsWOdsJFf7/YIEhCzYnO7QQwhXmS4gL8d/cTy/dRPRYeN5DYzE3y+ZJus
         6cZ3JVRwj6OWitFAxGyVeWLmPPYJj+dIqUdh85s7btp/ncy3ApPFUkGD55HgsnblooxM
         jJGwj+q1HslgvaUSF+SNHnqI2qqJ8iYHggQVYKEaA4rxyquj7kuNajK49+6ZtmYhKng+
         t0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763135966; x=1763740766;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yXgFpiaxg0LZlcZZHrI9y6mWIPy0APOxvyrLswjcxuo=;
        b=khiVBdSfEkKd3MRFObWgLwnUJ0zlclM4zoYIbmeyLlqAxPYJjhwAzr9fD+8SVUfclv
         qJEAHw2n8wthiUT/3/0FREBKqjsTN5hzMUVCl+sjQKSACz3TEDRB8eUh4Q5uFUZrnY/a
         adH8/E6rbUUAzw8wzyk3g8X62WPPqs27QT27Fba0ogJHsbgdyBP6T3YiRScBcaidA83o
         dIxbDFtDizHCIWspSAofUm1WyXYFyuXDTHRcT9pPcv8f0YvOE0n2UJqbo5aaJoDGfx2f
         SZdkn4eVfC0VmvbQGhJCFjOyQr7TM2BlJysBQRZCZ+HySVxZFBIcUo00tW6x7XPnt9Ti
         Wh2w==
X-Forwarded-Encrypted: i=1; AJvYcCXmDhm0tIfilGhY9wYxWVesxm5+LDJU1aFG0NYE0NzA9trR5G/OkLe+6Sl3d74J1M9JSsVCa4zX+56hlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT3gvE52jvZFjBLEBmIFONwscMS+St3ORzIPG8EtWQhzPllrib
	iyP0eV0LT5sSsmR2qh3avifpWzYo4vPVc29JF2T7V/3S9NNnUGFl2AYryXXmqPAmrb0=
X-Gm-Gg: ASbGncuML1d1IjxsLVsYy2gnWelhcFwYxrnr6HkmWvEhISztzwFP4qIpQ7Hc9PMA6gu
	VX7TVstXJOxChP/EFnFSPy8cC/dK75R5nki0aUTWkWAnm0Cg5SvRLPNfQ39l69Ku2t1hNM18yTh
	NCAzDJ3mLpGLPmjDGw/mcAmYfzJU0NUlwcQ+eFbKZbxOC1r0TWjcpAOzCeTFhF2yKeWJLRgLNvv
	u3AgqlXYkE47VvOnSetgCfk/9rt3TuTIFLKK0dbxehPeqborQxHBBIz+aYUT1Rjvl8a0YWv1Yk6
	XoE5Ya8z5UK7G8hBssmxVs5tkwMUPv0ZPtk27FMO0yBh1q2cSexxfUlWd5K0k5NzMb8D/XRpWIJ
	1I3Aqf4+EoqDkty7iMBdFg8GQ1LShx2bbDw7NoHIfuViGCEDeV532g4EGxbmcUU6wjgdncgFt8Q
	iRfCdsDqcrSh9Bf4fJ9mPifVX8X2VarwK8+tatnCCd7FDReUsGU2I8dqM2tgi/nl1RCJwtuuAOU
	r0pz9d3SDPKUa34Jn654Iw=
X-Google-Smtp-Source: AGHT+IGWzubFZLtvC9cNEOlO/RkzPlBtEEASvIevatDsvh+QoQs8cTds4ZRPcjtgHk3tw2xqDW/ZxA==
X-Received: by 2002:a17:907:1b04:b0:b72:ddfd:bc5a with SMTP id a640c23a62f3a-b736780b420mr340472466b.14.1763135966460;
        Fri, 14 Nov 2025 07:59:26 -0800 (PST)
Received: from localhost (2001-1c04-0509-ec01-156d-fa6e-7f19-0b67.cable.dynamic.v6.ziggo.nl. [2001:1c04:509:ec01:156d:fa6e:7f19:b67])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad41cesm406031466b.16.2025.11.14.07.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 07:59:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Nov 2025 16:59:25 +0100
Message-Id: <DE8JJCQA0C4Q.35NEED7XG0K0V@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] Add CAMSS support for SM6350
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Bryan O'Donoghue" <bod@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Robert Foss" <rfoss@kernel.org>, "Todor Tomov"
 <todor.too@gmail.com>, "Vladimir Zapolskiy"
 <vladimir.zapolskiy@linaro.org>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <3ph8XeidoxkUIsK7qiOH29pde94sdwa3ReWKVVrPabgS5enIAmwVAC5plyFnBMJGKQBnxFB6df6j69OMFIeavw==@protonmail.internalid> <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com> <df4a6a77-9004-4dbe-9b11-7af2bea7e068@kernel.org>
In-Reply-To: <df4a6a77-9004-4dbe-9b11-7af2bea7e068@kernel.org>

On Fri Nov 14, 2025 at 4:51 PM CET, Bryan O'Donoghue wrote:
> On 14/11/2025 11:15, Luca Weiss wrote:
>> Add bindings, driver and dts to support the Camera Subsystem on the
>> SM6350 SoC.
>>=20
>> These patches were tested on a Fairphone 4 smartphone with WIP sensor
>> drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
>> far as I can tell.
>>=20
>> Though when stopping the camera stream, the following clock warning
>> appears in dmesg. But it does not interfere with any functionality,
>> starting and stopping the stream works and debugcc is showing 426.4 MHz
>> while the clock is on, and 'off' while it's off.
>>=20
>> Any suggestion how to fix this, is appreciated.
>>=20
>> [ 5738.590980] ------------[ cut here ]------------
>> [ 5738.591009] gcc_camera_axi_clk status stuck at 'on'
>> [ 5738.591049] WARNING: CPU: 0 PID: 6918 at drivers/clk/qcom/clk-branch.=
c:87 clk_branch_toggle+0x170/0x190
>
> Do you have a full and complete kernel tree we could look at here ?

Sure, this branch has everything in:

https://github.com/sm6350-mainline/linux/tree/sm6350-6.17.y/

For further refence, at least two other people have tested this branch
in postmarketOS, nothing particularly exciting to report from there,
apart from that the sdm-skin-thermal thermal zone (thermistor right next
to SoC) is currently configured with 55 degC as critical trip, which is
quickly achieved when starting a video recording, but that's not really
an issue with camss, but will need some tweaking regardless.

https://gitlab.postmarketos.org/postmarketOS/pmaports/-/merge_requests/7281

Regards
Luca

>
> ---
> bod

