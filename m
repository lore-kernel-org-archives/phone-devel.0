Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1433E7174
	for <phone-devel@vger.kernel.org>; Mon, 24 Aug 2026 06:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787554170; cv=none; b=jxPyDD4XgNByrUxjnedN1e+6SlV1/z2gw1NX7UstlHl2nBXW3PxLaKgmEfg3w50ddbJ7NLxLWCadZoAj69iIkTFJfIqm1STM8zPVwJ0+u6mik1jXNMGHgv9riW5xYoFisK8m56bM/uP8R5VbPmoto+C0ZJ4g2YWORIv9DEYsytE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787554170; c=relaxed/simple;
	bh=MdgVsqytscDNoBcQq1T2DXmnKAy+0t/SSD8HWEOcbPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HNupsHylHOhgBUSczKxFGLCFwUzKv8Dt96E/hayrNB9+uSnzPEGv9kgqi3NN8mlxf10iSZ6KzUbBz1nrRQk5/a3pX5PGcNhTFs2vUO0MO2qqyxJPCQTjLsUXIMI2dATQOWj5O58sqgFrcUx6hspbHFx0onPWsiQzm/+jRS7j3Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LfM1E5Xp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eugu3q0n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LfM1E5Xp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eugu3q0n"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RCV81477849
	for <phone-devel@vger.kernel.org>; Mon, 24 Aug 2026 06:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2dD9MZSrO17sYCLJOzYAgvl/pfHfIeh6MHwlSpI4G/Q=; b=LfM1E5XpVDizC3qf
	MiFOZ6aQG9jGY5rDjbBb47nNlA9fwTP0/9ACGkODDLrS7TPkxuB+AgJGQCqYwgG+
	59f9d0r2EdbmirMkM4lrOgBJZP3+7lze13R1GO9xQGOCBZQrTg9YzEU68PsnedD6
	cUsEAsAp1MQCoomk6XrDy0W36xkdK/5U6YvDkdMn0azHMa8Hidktk2qOEH+sh0iw
	EaX8Ems5hYEsvpONXx1qSgla6LsYQDCJEpukDOaE1uJhpNTZaXaAauRdh4uCrj1u
	2LPlNBQuvI/xCd5MbblaiSRFgZeGWyN/GtkfmQdqh2zxNWRCV7BfXUQiElIyVqiB
	HAM/ng==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g7528nh9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 24 Aug 2026 06:49:27 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7376ea4bcccso62910137.2
        for <phone-devel@vger.kernel.org>; Sun, 23 Aug 2026 23:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787554167; x=1788158967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2dD9MZSrO17sYCLJOzYAgvl/pfHfIeh6MHwlSpI4G/Q=;
        b=eugu3q0nZ6mMGBxahYfrijB+PRc9fKbCDUyte86OYQJqaYygXugh+xgoO2qvGxnRtJ
         GiIHu/ThrMXnz1olTkak6TtrYJ02O3LaND2zYhqHZewqAUYNR8mMlkLFVDd9SwshcASZ
         qPaHnCS0UJUUeqkCovAh5jI+DG5jHvtzhjXNWi6TICAn/qQXgvFPQJinkhr1D9B/Af8w
         0Z+ufA+GI2B5ChvNfcROhGRrs9TqQtJ14IBHaT27mF3D1jeEqxuw51FttVxt49/KzlC4
         M/JmRH4RC389rmKssWp//Gx+e+fpHFZabTyWu5kfy9F07rzwagC7WHtafNfxS3N9VoSk
         e5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787554167; x=1788158967;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2dD9MZSrO17sYCLJOzYAgvl/pfHfIeh6MHwlSpI4G/Q=;
        b=AQhR4guJy0v4MitiY8WeAGw15vCbgYrp1EskRiS4nAPMFH6AngsPnJAdHLbvMp67QP
         7XVZEuj6gCfq9rvH7iKT1AFMoYGvyDh4IzduN46v6kISY6Wv2FRG4BXULwtgBgoinzDK
         UGvLv8zR/DFSH0IKboOMWH2MNm/tFUS6yhXx5XXNocJl3HMiE6XjwrOuvruL9Ya5PjZe
         U3TLEesoe8S69CfjgmdGEum+JfTchyt4H5OBkGZqpTuBTNST0nrMIe8hMs7UV1+mtGbc
         hUOi9dR865jNJBW33mJ3zpKzzaI9elBImCJM1vL4P+0XJS8Inq9tHAaPVQ00umZefmFn
         uutw==
X-Forwarded-Encrypted: i=1; AHgh+RpcpJ8N3xWy+oF+hNY4oF5wRkdbEMH0+SuQsvNYOGgvX2zt/TU2gtG80K+5p1ALWC2LK3JqjZ4TpLth0g==@vger.kernel.org
X-Gm-Message-State: AFuF++lOplEfo+MQIEhdZFNtd807Rc8m9ZWBotZaezgdEHJMT7JRgG6B
	OpYFFlLC+K7StF5hMCBRgJu0EGghZsKK3+Bb9pNf4OIGL983uNC9cELBHLFS59iBMb6A25jxKHG
	ovdlaXZD0h0Mdohh9av4W+gtvu5xJXMT3TMhy+jg0Dhs0zosXU88JWcRT5yvHQ6kfLQ==
X-Gm-Gg: AR+sD11YMscDjtuYAp9x5IuFWxcewyfELIbjStYAaCwHLzdDxkBBmHofZUhjTfnphbi
	hvrH+4sg1MZR4foIwpoeQnfAEXDW+xXRdNpaJwOcdYWlhSl+xZod0RFwvNM+V/YUgx3on0EpefB
	sPg+0V+EG+ptBvfJCKpqenRWaIPZQ6VUo0i9PfZict2JgUXb/mOeV8oozMZPCEy/fpTR78VLMJR
	zv7FCJSIYoHtbSnCQ/y93NR4PLc+FS7IZsPru2wgKTTf4BfiVno9htR5+SM2UxUoOpmpWmu08GY
	RhRB4/DLAK6dMfKMWzLZacOjop1DoU20XljoG7zVe+9D8WSjLbzEBvPx+AndB87D2MDbVh9KLBk
	vpjiIOZmIc381p6XDJi9Zyzgz
X-Received: by 2002:a05:6102:b03:b0:778:5579:c65e with SMTP id ada2fe7eead31-77a6434994amr2998283137.2.1787554166911;
        Sun, 23 Aug 2026 23:49:26 -0700 (PDT)
X-Received: by 2002:a05:6102:b03:b0:778:5579:c65e with SMTP id ada2fe7eead31-77a6434994amr2998268137.2.1787554166519;
        Sun, 23 Aug 2026 23:49:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e0126edsm7306458a12.7.2026.08.23.23.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 23:49:25 -0700 (PDT)
Message-ID: <f2ab67d9-e1e7-4ee2-8bdc-abf2e6b4baf3@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 08:49:23 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Enable
 touchscreen
To: Luca Weiss <luca.weiss@fairphone.com>, Job Noorman <job@noorman.info>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260821-fp4-hx83112a-v1-0-474941bd8860@fairphone.com>
 <20260821-fp4-hx83112a-v1-3-474941bd8860@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260821-fp4-hx83112a-v1-3-474941bd8860@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DsJmPm/+ c=1 sm=1 tr=0 ts=6a8be977 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=2kaJ5Qa3FYFKpuAPAowA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=gYDTvv6II1OnSo0itH1n:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: F58MiZ0ieLRo2H_-HOhv_FKphbpozu1h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1OCBTYWx0ZWRfX0CaMQaG4q7lf
 aWuyRsk7bCzYlnc3atGp9TbdC6Bl7jokW2UkDlZd0iCYmI/feGfmSB4h9xUvg4ULHgS6UI1Hj0Q
 8ethqjd1m03HhYwsnYJ5/S5LylcdCnWq5uYJfo2nnkUegqHVGduTgIQOmmis6wXdrcS2x9ndGd9
 JLCwFVosSR2o6ZjjrEIZrlwDOGdHinyAzvn0w+9S7oBAGeTtmtzmqP9tMyNbhRnUHRo+rSKbKis
 bI9Bo9UcU3YmlPH6vkdIxLEz/m6YSIXtpB1OX6fk6mcvqFU8OSGYbhh1o0j4GJA3mBCau/LU8lG
 uvpedFyAh1r9NvvdueYgKX/baA7zTiqtJJjOGcNN4ZZxE6VKRBvxCr7wBLsCx/5pe5gMh2mCqhI
 c/BjPiHPo0HObCcGUs8QP13Uc0jcczrJbvkFMtoUozdF+/2ClQ7rDnnuhjke7mon41xT7KIbT2n
 CDT2d1n1cG5uQUNgMRw==
X-Proofpoint-ORIG-GUID: F58MiZ0ieLRo2H_-HOhv_FKphbpozu1h
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1OCBTYWx0ZWRfX8y4Um631+Vt+
 Qlwed6WZe3uZtvH0oHUpXYMSMEQAC/V+QuJhe4pALrSU++Xre9I34UZL3qYjCiiAc9Bpz9lD0Ct
 JOTPmlyQC4rfFeO0pm4zHopW1aGDxm8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240058

On 8/21/26 9:12 AM, Luca Weiss wrote:
> Add a node and pinctrl for the Himax HX83112A touchscreen found on this
> phone.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
