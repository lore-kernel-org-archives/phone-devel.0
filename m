Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A452E7F0A
	for <phone-devel@vger.kernel.org>; Sun,  7 Jun 2026 18:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780858653; cv=none; b=ol7DcDfzcwHVlcBXjvRBB3W9vxwRpI/VUpFWwCpxsEL1YlngqmPCM9Yt6H/9DIZgSmBKXIVbWMMNzrODybWOUwa0l2Wb2z/zSl/t/8iIz003yXOT1vK9dv4bYsJdSD6b6e3BdcQpDKBvOhhHV0awT6yKwno0PSlipL2PNE1hxDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780858653; c=relaxed/simple;
	bh=0Z0rUk3P6e1aKqaUDC+dnxoHSCEs3RS+zTr6XjUVdHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZhijuH0fjqqD5Wx4zo9m/CIGkZ3W/muU+MTghsg3hQQNv9tmlWEIYjNU7HGfgi2zR3Rk+bbMNIryWRblrN9fGoOikKSj21GbzKBrqkg9G+Ta9MBqbOg0wJq2cLm2I3NuHWqZjbEgpN8oVOBih5Yc5Ikr4lvO3LLV2wG5cmswZhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GR4fj4I+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VZqjJT3Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GR4fj4I+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VZqjJT3Z"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EmGSL889818
	for <phone-devel@vger.kernel.org>; Sun, 7 Jun 2026 18:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=irC2sN3m8tT4b9PsGSb62/W1
	2PvIW057qsOi4D4gu4Q=; b=GR4fj4I+5Yz+sS3CGE2HQGMFN6ob1xrZKhgDfVSI
	XHYfD0QtajQzopGXtY2seqyKweMXAPyDZYKSLgVMMbZbIrp+Nx6tn57tGFIG1DDS
	6ZerZA6/IUclEhFd9cPwSge7X2rnVbC+EVndjkBwyhB6FGrAE3efhDUEMMDz7Cbc
	TZFnLe/Ea5WSMZC0lu+ipcZrLcnyHomcrY81sD/KOFuHosHErJTv/W1iG8vsRtwn
	MvAqZaGJuYMoYcisjxJWuBWABFK74b6l3eRhmdCGzgVJpP+0NqkFHGy6AMy/1GbO
	yv/07LYfTJs5Z+HzwP+lwDhfRxAEMl1NyCw9MWcJQn2lFw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4vun5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sun, 07 Jun 2026 18:57:30 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6cfd441619aso1488947137.3
        for <phone-devel@vger.kernel.org>; Sun, 07 Jun 2026 11:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780858650; x=1781463450; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=irC2sN3m8tT4b9PsGSb62/W12PvIW057qsOi4D4gu4Q=;
        b=VZqjJT3Zh3Aa7eVA/mmu/rnGOlUZ49K9vPO1DnyOzX6X38++0xjkrMZbcQygVm9n0i
         pJkdhzcbhzqY5jwR+maVykf7Ec8T4ww51Rmzni/LGRnokDDAWv+gJyMK9+HN1Oy/c0WQ
         Z1v9wa34Q+DxuQUEdKTviLt1Kw76CrCTc46S8fDkfUBzubg2V3APPKs/jUdHoR1zYlxc
         PCit1AyEf7xlu6A4fL2QAxIsP2JjLA0ZISZSkEmjX08rDuIF26wuQWmzrc2AbGJxEJ/3
         cTTrqVyuW8Mn5wkatz+Z5mfC4UqDal5KvSTwu+l/SiYINssQHfPAAdHdqg+X4K8RFxgO
         eO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780858650; x=1781463450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irC2sN3m8tT4b9PsGSb62/W12PvIW057qsOi4D4gu4Q=;
        b=MVTKD8Lk8vQ6IuFeWQsDtmeHaJGhbAP2orCbOr6HGD/V7YTE9tyc5TciETz/moR+XR
         3O/SsF6oIuZN5jrxzTrs/bzj3f9fjHzQI7M+cqEMH4uKlrXUY2sF7KmJSMU0hV9cmCc1
         lX/+u5Nyv+kG7cpob62BOQU4xsQLH5o6ZeCHA67muqGBWQV2CnPeFDU7CZGb8c/I+Yls
         3kAa8UDXNvfch8dRH+eQV/ADrMlfpdw5mWd4EH+KqgfAQeNTE+yJPiMzsFIg+30ENQik
         u/LbMP204rE1y3npNQEp6RNUiHcNxGCxcKa6sA1/8T87AIyTjRUbdWeHp4Mxb+WjYeyO
         dNwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+qLEF6gE92cD0I/CoYXQ6xxio593DPgIcbR8Z0AYK6xKDg4X2aPKCT9JdOPtiToo73rNm0iDr8t2fABw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSgkJJ4mqhHdEigqfjaDnhtOvHWTdL7EY9yWi7bIVbl3Af7Z2i
	MMDK8AfdaWLaie9CUFVGSPVlkYrWUjiH43k7wqdvHdscsUylkih6aVOZ2tpBTfqb/lOQmPNxSHI
	6u1SLxqHK2TrnGg45th4J3DIr3PuxK4JkAuRAuHfdWCw2i6Y8+GsKgGHmmXWqfD6MTQ==
X-Gm-Gg: Acq92OEAQQUsu+JUV3CYFPzm4zCzceDsmLY78NjTg1761v48nzgM1MOXbsk+pbz+969
	b2T1OglMxMobuWnHY36YLFZDE0DmX6OOj+MUqxZPFjgOGrHp7Yh+A1t77vSK4oOULQp3i0TuJTg
	1UgmcxXZxGftNtDdK/Ld66bMy13J9j+Aht5t8i2+Jt5M8O6hGJRqcTBtiQKTVBq2hGnPIAi5UwC
	AX4kQ8jsfaiIaFAQdW+0a2P5d0qTra/KOe/74Hu/+K7YiMzamrw6vf+WXfktR/1BjPdxX+jLJYI
	rlqzg0fEH0SMABI4vU9lTAulmmNOD7HanF1vq3/n38/Wu0O2xO8X8P3elY0SvEFA5gO0zYO7UNX
	+B5EJ5Nmldlf8lbyWy08VG2aCxP4aIzHNbQ0xuxd4fnA+obpMTk+hKy0HysWd3/mjDhkLUcnBeP
	q9CatWJvqUIDhwzCTzIuYERpiiGXPSnKVhT4AM3NM4JiaBNA==
X-Received: by 2002:a05:6102:161f:b0:6d4:ba3e:bf97 with SMTP id ada2fe7eead31-6feef46bf5emr5702258137.4.1780858650098;
        Sun, 07 Jun 2026 11:57:30 -0700 (PDT)
X-Received: by 2002:a05:6102:161f:b0:6d4:ba3e:bf97 with SMTP id ada2fe7eead31-6feef46bf5emr5702244137.4.1780858649647;
        Sun, 07 Jun 2026 11:57:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97b042sm3249598e87.47.2026.06.07.11.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 11:57:26 -0700 (PDT)
Date: Sun, 7 Jun 2026 21:57:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Convert fb
 to use memory-region
Message-ID: <bkwnuydwhalxrvr623zaxwad6g5hb7eop73cgn6affuqz3ozya@wyt2ppg7jtuu>
References: <20260607-shift8-fb-v1-0-72b9dac25f4a@ixit.cz>
 <20260607-shift8-fb-v1-2-72b9dac25f4a@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607-shift8-fb-v1-2-72b9dac25f4a@ixit.cz>
X-Proofpoint-ORIG-GUID: RxqbXsHNwyZ_JgNdXVjS1JbDJiqpGYMy
X-Proofpoint-GUID: RxqbXsHNwyZ_JgNdXVjS1JbDJiqpGYMy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDE4OSBTYWx0ZWRfX4nnmdoUYJzbw
 9LHEAAiyXwsKwfe43Wg5kKEnytsho1ebMzsObpngGPro4Gug5EH1SroIf+rCejIlvXqaS7TFNpx
 ti4wZ5O9UB/UT+oPKYgrNpFoaK5coVC8Jsd6282ie67YorV5RZju9Y3W9Tq1lVAnfjCr+t8Rfla
 spNeImsprVj8G9IDvA9DnEwRPH5jYIc1qApXpS1IfN3p6pMS1NCZqvztQ2NkXe43Mdcyy+Df2An
 BIeysD20TT3dmog6o3BkiEis2NoWkCuRVp9eoAloxrGLmDWeTqgwwAKxahwNdj5d0lW0QRYo8BA
 PMmMbrKeQHUJwjuEkLMfYd2XNUT+hgs574m/CFVIpFYqWqy3Q8JmJzY4icDoSiiWU5gIkCv4TEG
 x0nOd3o6qpUNaDzmpqGhaXZvdC4l7Yjl6UMRkIaATpa5YIGSG+ZPBWuvJXva+mDajLe3MIR0a9C
 HGvX3GD4kwusGwv1GIg==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a25bf1a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=NdoN8BoSjOhuqMYtIe4A:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070189

On Sun, Jun 07, 2026 at 04:12:19PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Instead of manually specifying reg, reuse the memory region.
> 
> This fixed mismatch of the node naming (0xe1000000 X framebuffer@a000000)
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
