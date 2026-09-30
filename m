Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CA9492E3F
	for <phone-devel@vger.kernel.org>; Wed, 30 Sep 2026 10:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764787; cv=none; b=T/QURfn54WNvB90tc8TAcfGDH8nAmXRqcmTJzgVrdWVh0NX2BZpjCymo7M2actzl/Ht6mHSpufEnjYREaBq/ZTRjm3iAJW+1Pxipx8OYMbHqNhnVgGY5Iz/BDkh49vZRw6mOEvhva8yD8tdRgSc4yIH5bqtSXDTbhtro1u2UKZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764787; c=relaxed/simple;
	bh=Mj1IOcMIxhElrq67uOZbR13BSh/iIb8XuN8hD5RzMls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KsNCmOQv3Wf3ayUiB8033Sm1c+JYX40tlguLVOxbJngsmu2ssvh+LwtotCCI0YD+XDAPG8NsbmNwLHZrq/qJb+9lA3R92v4mSg5rHtrEeWW3jeBKZTZP3oISY5mFadgK/Ukbxr6gAkRbA6X7Zrr81idGBnmz+Z77swhAnt+Rtg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fLTco5Pe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hs5ernKD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fLTco5Pe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hs5ernKD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UA3xoc3414045
	for <phone-devel@vger.kernel.org>; Wed, 30 Sep 2026 10:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NxsDdgmSrXEpefiv4dLm4x7z/LQYERZV07k4WnFvesk=; b=fLTco5PeKrhH7QwP
	/D2Q1oMQ5w0NSRXs4BBCB81BTKRePSuT32S7y6ZIuwUkch3S6ZsEa4zinCyLf28L
	dE0N/rrl1LP8LfzblqA3FOusyhSMUwAaM0EIzt/1fHbeagEzmO8XPmGCJ0TDDFjL
	Zmvvb4w8BlOS0od/vLrXab7Q82xgYDSZynNHU0RcGIzRaFkEw2Hxb47/zyIzeTyR
	CrAi6VozFthWMh/S6HbHycEPDeLFEkFAlN9urLIzrFnHKyOaXMixNTgNVYC/6hus
	O0otWeNhM+s5lTec+i5pIdq3m7yHzOJ1S/hQx6lQlzpI2TT4wcN3y09d8xX7qpwX
	YhARLw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bk849m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 30 Sep 2026 10:39:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530f1b3dc86so11681211cf.3
        for <phone-devel@vger.kernel.org>; Wed, 30 Sep 2026 03:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790764777; x=1791369577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NxsDdgmSrXEpefiv4dLm4x7z/LQYERZV07k4WnFvesk=;
        b=hs5ernKDbT/BgHdTfnRDeafSV8lYsHOh9l6vZIPFthkO0CxWfjJ3J6Yo84YrBE9+ug
         zq2RfFsQ8Nug4gTDZfTV+a2OZNBYFXoCf40SWDGDkSKanWBHi/lzw1UX/ZarFOHS0seT
         0apmCI//GO5/xKG65d4ta+6EeGE5lbPNlrWkkAUeuh2huEJ7bu2cLbaDlPHGb2XDrJl6
         KCSkOSf3hjrlrglm/E1gwMj+uaJXDTscXLbgqkp7zwKpxAgCz0miVzVqtMEc39olS4IP
         cjpNisEEDXm78ogfbynB4uPtPpGkn9yQSSOoitQ7BqVXQuH9o/ifEOlMOhNuIRMmmXgI
         DLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764777; x=1791369577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NxsDdgmSrXEpefiv4dLm4x7z/LQYERZV07k4WnFvesk=;
        b=XrxVLsyZ1A8tPiQn+NGGDkc1liMY/YGy3H1Ax5eyxG4QqqElIBcoJcg5bYukZtU27A
         WhBh6kkk8lSpuQVF1acY2UJtu5Py/ihUB07mZWIikO22l+4Z16UtVof1N5WdCy1WE9Ne
         cpQtVVn69gV6w4B7HJyGQSWIQs9+F/RbB2FG/OGCCjQuw4mQxllBYbqOTStxL/fZhHZ4
         DmqGlRQs9v7HdtfGEcaGvF+K10E2vmh8XlR919936iRPsaxmjvEzbReiYEl+u5OAqsrJ
         ZJ999P2Av+87grZ/2D9+83wALcBqaHH2YA0xi+FXR3CApJzadTxM2e/N387qbNDIMTIk
         GGPA==
X-Forwarded-Encrypted: i=1; AKwUvByzgz0XL+k8zCIhp0yU1xOehAKvWmcLqYa1TyCs9JYC0ykvHWWaNYXF918uOnUsZ0RT9hP2apo0FltzTQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nw5kEcUIrhwDr1e/iGRrNLFz5bfALAfLQM+7gfPj07dIUSKgQN
	G088qDJuwLKmDuly2aZSz8osIuSs2OVnUJviOcc0kNv8SA4SZsUyv9kK7VhWjB6nXfixFGpbNT0
	oO8xxXpEcOPLZomF2BaoU1ypDZCmvJyOodGwOwY7rJf4yCQDm0Vb1ZIxESrdpk1EtCg==
X-Gm-Gg: AYBFou28hVQt7w7gkZfgCQ1ukDmmouZa9ZR568D6JEkm35ovSIq5ruc1zVQsbSR/zVD
	1r4DNFYFph2aSTS90dcQx7Ci8WMqRwri5Dz3to3inBmEVpLK0tCgIXTAF0ftzZYd9hfmI3UC37K
	qz005D/+9j2ivUXm2/Tq+8VmjBY+ahCgh4pdO3SADf+APmmR7rSltaWID0vZg8zxCQDQIP1S0Rp
	1H+o7bQbYHGRNnTEdQsglQ2wajA02/cNEBOgwmUUF491GAUR8hmAvU6Rz+7XMpck/FecjMpsoig
	kSIasL9GYsaigueF7bpRK6Q0RpWoYJuojBMyek6bn+y7iPRByEKGC4aEU8l2OIDL2dhobdUdOiW
	T1R61IOm6TWgcFjufOW2Y7g==
X-Received: by 2002:a05:620a:261c:b0:93b:c6ec:780d with SMTP id af79cd13be357-93ca9880834mr131065185a.5.1790764776706;
        Wed, 30 Sep 2026 03:39:36 -0700 (PDT)
X-Received: by 2002:a05:620a:261c:b0:93b:c6ec:780d with SMTP id af79cd13be357-93ca9880834mr131061285a.5.1790764776150;
        Wed, 30 Sep 2026 03:39:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f80f5asm47036666b.48.2026.09.30.03.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:39:35 -0700 (PDT)
Message-ID: <667fe242-7779-4a8b-aa01-19277ff8d6d1@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 12:39:32 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] arm64: dts: qcom: sdm845-google: Move panel pins
 into common
To: david@ixit.cz, Dzmitry Sankouski <dsankouski@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260924-crosshatch-panel-v2-0-08d5c7bf72fc@ixit.cz>
 <20260924-crosshatch-panel-v2-10-08d5c7bf72fc@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260924-crosshatch-panel-v2-10-08d5c7bf72fc@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oCdCE4FttQ5I6nH5XFy0clNLTYWyVAaX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MiBTYWx0ZWRfX/PU9QJkc5gB+
 sVMtWSb6gdrDEUB77YmsnWLRn1uwPESXT3lfGHFEd79f0Nmu9rZgEu1RCo/mQUH0t28qsHog/Qr
 oMnhPfmTPEDao0bF0hgAwjXYR64I0dHAYtW9gti0aSd3tgYj/7CT7N4BafsVTFshl5kL430DDuV
 su9fM7XmMOPM8HkcdoX2geKZKwJ6BCkNBR46ZJzoLLaOA5IPbLlBxGOYhDeDRq31t76iXlvIwUG
 e7QUcGld2IrAaPJ+xmKv3MshjVXXnekRUOz24zRogVjVBb3ZqHv9+x29Y622zfEslInMCB/DC+I
 a9XDD5PhU58DTFkWPRrl7Ubwny/isX2R8sYJqPdux907ezb/VfLUR9dSd0la+QU0IEmK1iMKTvl
 av8EHn2WSyOkLqDlRSqxiH01IFh1J9pFovb5A0gBFBf1PS1l3bAx2aAnWG3+cPWUyCNcEA0THcd
 AjQR4MCQQHZJSK8H6XA==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abce6e9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=LCudcodfsoFH-Sas34MA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MiBTYWx0ZWRfX5KaN5emNhbv/
 iETd13k3FP2ZSISMhgWCGFr8LVEeJm3nTDg8i+oi3jdQFqLZG11wQqN73b6RhuiPwFZWP/LFYp8
 EMAcET3EjK6lmCvmNkpgRawBFVSVVpM=
X-Proofpoint-ORIG-GUID: oCdCE4FttQ5I6nH5XFy0clNLTYWyVAaX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300042

On 9/24/26 4:01 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Both devices share the pinctrl configuration.
> 
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

no real reason for this to be separate but okay..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
