Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00550317163
	for <phone-devel@vger.kernel.org>; Thu,  7 May 2026 09:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778147612; cv=none; b=hC/rWF7Ynd2b38TRwHZahnfUTttiwaBJrWkm8AcHLvhUHQ4AMZa6qf4alJTi2ptWe19qd+B5iBOgzCjQdFOkWksyZSng12I9uf8PlOWfpahGXWxNyW0WtG3HzN6P6259rLBhCxdqI11XKlnjRe6K40ISVaXHo8ImiYNrAExtKgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778147612; c=relaxed/simple;
	bh=esOQNYyk4S+1vRyuW54BvvEdRBVJYjf+jiRBNIb46VM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lB3fFShwQIs3O1yq7QbjMTK9S9rdaWearREdpiP6rSIOOBnpjh7uTrvV4mfhvutp5BpuabstjS4BrwDN/EtVzJ/ivl7e+f3YgHRNH8QPTpHpGBkbgP9SJXyDPwLMLLakRBOVlXRJ6geB0XrbcsJWS0PbFsnSadKyPOLUIVfeKlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pj9woii6; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pj9woii6"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7bd87e5d8ffso20865797b3.1
        for <phone-devel@vger.kernel.org>; Thu, 07 May 2026 02:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778147610; x=1778752410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u67GhOwi0lZemgHuDxTmq2QqkO8Lp6ag0DvuYlZNi8c=;
        b=pj9woii65iLNLmKkAWR0E9QTnZAQFuYEjZM15452wL+5/pcj6YkY1cdTEz8UprUL95
         h7CmtDoKjDVN7nGQ575jfba+hcGXDQRyy8+RU84ohz9xEdQljvCRLGv837ILKipL+dQK
         maRBwGfrVpOg3ZnXyEjqBHaPifBywSn0PIUXcFTYLT8CIWEmV+pWobphA9LWW7uFMMGq
         S26D4alltH6q+35f9/3cpBm1YJ9Lsc5PuwUk6Ak0uwV+asODDM62EGVuysHjfJhA1tfR
         6Y+jEUiT6wW721iCQjv5uMOgXRqVu5pR7rp04vhq8Yvylc6pnb/v+QjwBxNTLyRjP5HG
         8DdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778147610; x=1778752410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u67GhOwi0lZemgHuDxTmq2QqkO8Lp6ag0DvuYlZNi8c=;
        b=cWvvxNgCycyK1CAzVPOtUzaaD/XA9UZy9ABLCH27b+l2YUdYu3xlJvn0cOewHdNn/k
         BBuDwKU7RPn7dzgYPgwLceeUQaYz9wptRwzREsZGw9OxIWjtmwGO8/MIMosrp/DJXBtX
         3aZJMounEHyrlQba2IKTdU2HKxWd+ycW6jtwzF6Vy2TnrGy7Wm3azQD1OgktYzh1s3qx
         h8JTDTjttB6XxiF8ius5dt2Oe4MYCMIm2CPlFXFmPqiwwSpsBBfwkxLJnsf1GEmS0oVv
         TfIE3pCThHJosMymrGpo1OBny9i5Js3w7kfz08opp/KQQ/zIb1X9lgjFZOqyN4U2ffsl
         jMUw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZG51YpiwLx00SynapkTYu3x32sy3ExganQNQpugrUnv8QdWPHTdSMkiM0JOSkIuKSFMVtHGNmJN4Csg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1ISfdgBXVl97CYgF62bv2ZTV6WqpuBWI94Qr6lpFT9Zksa02I
	QKWELNrlEzp4Jke0UXzoQNeDAGjLzWagsGJplAidPByxhFzJgvwATGMi
X-Gm-Gg: Acq92OHaPq5n8t/rCPDLQG3SAsuHhqtiLKYTY/Hi67nYuOq9qNPwVSgQoUQO28wdQg1
	EAwWz+efxfTe5Kd2L4OleZJtWPtS1Fj33KOW8Ovu2aYg7K2wVcE+VJQw089OVRUlIFULDGYf6BN
	XRYTfKocQ17ispiojybVKtLD2sr/cuIKINZKVt7FNfgYi0SG0g25bSen13cjZAu9E54iLwqbTor
	W/5kXdt0aEO33vp1Zrlq1VhqtPoWFrluWQHhQVjTcHw9SyK3nPWd/4jKydZ9ORq7Jp6bepHvDmZ
	Iw82YZKA+FiPJ+MGmcWss/t2M+B7cHBF4Gzi1zjTebzUbCbeR/BXRibuMNkw65DPvirC8SPyAIH
	/+o0qgVua6v+4AYZxKWmpS0mU+QC5OEw+mndYmPVi4IiZ3tHujaxdtAb/mdopSxHQn1hePLn6s3
	DC6wSth48TKOJYPnM5Y+L7Enj3PViMGv0LWHMd
X-Received: by 2002:a05:690c:d90:b0:7bf:b4a:179b with SMTP id 00721157ae682-7bf0b4a1951mr7423237b3.18.1778147609957;
        Thu, 07 May 2026 02:53:29 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd66837872sm90497647b3.30.2026.05.07.02.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:53:28 -0700 (PDT)
Message-ID: <4f1ab5b8-3bfe-43a6-8b91-317456188544@gmail.com>
Date: Thu, 7 May 2026 12:53:22 +0300
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
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <17c4626e-8926-4cad-842d-a1b171d1e962@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/7/26 11:59 AM, Bryan O'Donoghue wrote:
> On 07/05/2026 09:32, Erikas Bitovtas wrote:
>> Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
>> device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
>> to these GDSCs to indicate that they are hardware controlled.
> 
> This is a misreading/misunderstanding - supports-hw-trigger means the
> GDSC is capable of being configured this way - not that it _must_ be
> configured this way.
> 
> Which leads me back to my previous point/feedback to you in the previous
> cycle.
> 
> If you _don't_ apply this patch, do you get different behaviour when
> trying to switch on the encoder ?
> 
Running the following ffmpeg command:
ffmpeg -i Videos/big_buck_bunny_1080p_H264_AAC_25fps_7200K.mp4
-input_format h264 -c:v vp8_v4l2m2m -pix_fmt nv12
big_buck_bunny_1080p_H264_AAC_25fps_7200K.vp8.mp4

Fails with:
[vp8_v4l2m2m @ 0xffffb0386870] Using device /dev/video1
[vp8_v4l2m2m @ 0xffffb0386870] driver 'qcom-venus' on card 'Qualcomm
Venus video encoder' in mplane mode
[vp8_v4l2m2m @ 0xffffb0386870] requesting formats: output=NV12/nv12
capture=VP80/none
[mp4 @ 0xffffb4b3b7e0] Could not find tag for codec vp8 in stream #0,
codec not currently supported in container
[out#0/mp4 @ 0xffffb4265e70] Could not write header (incorrect codec
parameters ?): Invalid argument
[vf#0:0 @ 0xffffb72105b0] Error sending frames to consumers: Invalid
argument
[vf#0:0 @ 0xffffb72105b0] Task finished with error code: -22 (Invalid
argument)
[vf#0:0 @ 0xffffb72105b0] Terminating thread with return code -22
(Invalid argument)

If I revert the patch, both decoder and encoder fail. This time, encoder
fails with the following error:
[vp8_v4l2m2m @ 0xffff8d356870] Could not find a valid device
[vp8_v4l2m2m @ 0xffff8d356870] can't configure encoder
[vost#0:0/vp8_v4l2m2m @ 0xffff91b3ba80] [enc:vp8_v4l2m2m @
0xffff8eb78f40] Error while opening encoder - maybe incorrect parameters
such as bit_rate, rate, width or height.
[vf#0:0 @ 0xffff941f25b0] Error sending frames to consumers: Invalid
argument
[vf#0:0 @ 0xffff941f25b0] Task finished with error code: -22 (Invalid
argument)
[vf#0:0 @ 0xffff941f25b0] Terminating thread with return code -22
(Invalid argument)
[vost#0:0/vp8_v4l2m2m @ 0xffff91b3ba80] [enc:vp8_v4l2m2m @
0xffff8eb78f40] Could not open encoder before EOF
[vost#0:0/vp8_v4l2m2m @ 0xffff91b3ba80] Task finished with error code:
-22 (Invalid argument)
[vost#0:0/vp8_v4l2m2m @ 0xffff91b3ba80] Terminating thread with return
code -22 (Invalid argument)
[out#0/mp4 @ 0xffff91265e70] Nothing was written into output file,
because at least one of its streams received no packets.
>> Venus core clock cannot be enabled if Venus core GDSCs are switched off.
> 
> True.
> 
>> But since they are hardware controlled
> 
> False. Your patch makes it so.
> 
> The question is, is that change actually required and/or beneficial here ?
> 
>  they can be switched off at
>> any moment. Vote for the Venus core clock to enable it later when GDSCs
>> get turned on.
