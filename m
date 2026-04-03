Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6652F9985
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 19:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775244437; cv=none; b=edhc8QsleTwLkjOTqJMmiA5cnWmUSyoL51Em8FLMMsGhTCrjKwNWE8dlidviJmvPOnyayhsMAB4nK2TU+n/Uy2KTkBNKiH7kTTZRYXxEg2LbNZPAGs8bZmKVMWoSv1oAkn1YGF9Ya+nb7nMmsBJE2xqFweNztGcIUJRFmOBv940=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775244437; c=relaxed/simple;
	bh=OU3SFsCVwVCAtNYnROQaThuCZy/FsLCS9vTE9MUGr8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+Fd3B+aCcxl670gmRCnWw49TJtpMjprVJLakCg+xycbdRELvx/y8aFnBQio35BRVFySy1AuZJRSMQVl1EQESXs0mqgDIIewJ9cyHwq/mrY9c+aC4xUPD09heeCdtMmYsogWkR+GKDYKvuBjkIy/tJpjVLMHG5z/dL8MTIN4Whw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EXSIPFJy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zunm/znt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EXSIPFJy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zunm/znt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633EUbPM948009
	for <phone-devel@vger.kernel.org>; Fri, 3 Apr 2026 19:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EeCH9MesYleZ440DjmzWy+Bf
	mTOxuDkYk/i+DHg42j8=; b=EXSIPFJyEMHuMoNIEscCihVLG+TT6JAnC8buXY/v
	mFHjcdfXBtXC+y6UqoCtQWrFAwwZxHygD+o+LQektSBsm37VZ6EgK+jV3WXP4QMQ
	WyYU4QgIJsNE+hPKZWEqf2bS/xVEcDltVpHk2wGGpgZgkvFf5zzmqHyoyePOXVpi
	6AU72sYWx2mNOOL8ki9EMdXYyj2CycU71pM/gmniluOAZXlLWbnqjnNlKuTeSVx4
	QIGDCgUHcGRQUv4mtLnnBUFNzrXXOcVkrlrXX1lDxS03eUyz9i0UzQGOu5aPlCC8
	BayyaSui3vxSjTn5S5cAETdIb4WtGCutIuU8rWpU7cgvqQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9xwfkq9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 19:27:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093025ffecso38794431cf.0
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 12:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775244433; x=1775849233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EeCH9MesYleZ440DjmzWy+BfmTOxuDkYk/i+DHg42j8=;
        b=Zunm/zntueM8AV7lkTvD3jJpxhUDIQOBVV1yLBz2qPFPRgQ+u9cMBMyVM2s2RZ+e1L
         nSpIju/KUighKNP7q7Xk8yguGzPyBWofHCSgamm8qJZuVo4gd5UkSla3EciXvvLasJK9
         O5hR3Pg/dgyEQsUmoPN7Xk4Mwquw7gUdUwfel3hZ2O6j/0oooXhb2ZnUov1HcAZd91mQ
         qjTTcFR8bgzB3+1YKV3iFp6ZIJvZd4DCUrNNADqMXXvh1APuLsdB/28i4K88Y19cbXaN
         YZJdruF3dFvL3h7A8az2YnVB6W+CnoIjPJp6wXJfcQ/vUQHZW8UokUwSHIstVY/hb18K
         SlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775244433; x=1775849233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EeCH9MesYleZ440DjmzWy+BfmTOxuDkYk/i+DHg42j8=;
        b=XZo0/6P8x5AOS7Q/GMvC0av+G7483KVVJd+Zrit0LMm/GbSeK5BS2lW49G/k8Q4+TC
         wdOVhoCRaaEccCIANpxlKSY9qt+/WX2Bh7Envy2HGu0cy3/7IPRHSmmsbla5XLA9i7A2
         yZBwHrnhSOxigy0u76aS+wsDNmTPbmla0PFLgNiOLFv65Hf4rTGJ2r4MEmLbacp6w0O7
         g6lMuX/J+E8exn3RvdoPA+lwYA+ttYBc4Y2iaIsrqv9lZMwvwrQqGsL7hSYC8S+Y92jA
         l82Nh04MPHTM+xhn5MXUSjbQ/MHvsoRHGIlZCU8ArBJ/WmJ+8Ipi8wiwp9h1W/W76hjH
         B4sg==
X-Forwarded-Encrypted: i=1; AJvYcCUOQQ+SYaLJNZMBLfJWpDdM6vLo7RNFBH+UQQy/cBqgO7L67HwRwSb8G4vHgbdnDp+iMuS6JNFHq2dmxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbaRTgV0HWqfcJgysipIzlWC5SJrSBw96N9Z45osS5+heY4pWf
	GkirToIOssnOln6dp9Bz8yJemamcHDFQ3qys1Wwed+PFkDzwsypfoaEUfFrO1ayhDmYlo2j7iRx
	ivSpa3qjq0LiY3CTiyY6VgWvcbSGAbcUGvIwM9gm6NdMv1ZfS9NLUDYjSRe/ZmxgSWQ==
X-Gm-Gg: ATEYQzxT6SjyL39wgyePS4fAIu1FffP1EZhRBcrXdB5sAr12M5WrQKulKYJg6foFpuo
	36hdfd3MQYVvPWS9CI5YEY6hIRg0Mak4MpFucrJN5i/ZWmJm4nZb+/rcAbzk11mg5esP01YN6fS
	oGl+zXbsgQu388eK/M8PvOff99JAkxreBlLqs88+kdGFHNouq+BxbDj1JUO4F/NoQDJGXNwUEMy
	ekwX1JRMSnoSLZJsf3lJTmeAX8DvUTiIN3XJyRm16yoMMi6yfZaKjtCVSazLoRfwrh+uE94pAnu
	8asQxsvgW7MYcSJfTK4f86UZTepr1O61wHwWBgYQWFmhseS7gwq7ajhtlnXzCPeXawLydUoaSeH
	aXpLGADNupIZF8Zd6xKmcT7og42waiH4yuu32F9TxceVQaFV/CgGJ/LdvgfxjDSt6tms89HFiL4
	dxoC05V8NjGGUHDPeLGPw1g3lJtcjhXfiYiZs=
X-Received: by 2002:a05:622a:5598:b0:509:3cd:b243 with SMTP id d75a77b69052e-50d62773eb1mr67413151cf.21.1775244433475;
        Fri, 03 Apr 2026 12:27:13 -0700 (PDT)
X-Received: by 2002:a05:622a:5598:b0:509:3cd:b243 with SMTP id d75a77b69052e-50d62773eb1mr67412801cf.21.1775244433039;
        Fri, 03 Apr 2026 12:27:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc6089sm1638171e87.50.2026.04.03.12.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:27:11 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:27:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: milos: Add IPA node
Message-ID: <qt4hktac7i2nwuoenlbu4mujmlp3v54ak7glbzu2roxvz5otr4@ehkqawyhiqu2>
References: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
 <20260403-milos-ipa-v1-5-01e9e4e03d3e@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-milos-ipa-v1-5-01e9e4e03d3e@fairphone.com>
X-Proofpoint-GUID: nQpJTtLRvqTbDWbgO6weEoGjDY0dVmiX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3MyBTYWx0ZWRfXxuesFH8D7GKM
 /GTtyer1x6EHjMPwChp9+RxzfyplwNSg7zFuG68Lwi9blUzF6kpt7TTSovo6HDG1jqg1D767Yei
 ZW/S8SqsgSRovc4rt10f9SG5aY5QH1kyehpUQZ4R1BTkWDlJo/tGv3INHZlwjtSZPmVLLG5Zp7u
 +7hW8LeyD2pJ2MoACQ3NWMgWzCvX42BVXfEAPMwFdhTF7tgE6U/twi8Kzg6XeeA+XjHSxfroKFw
 R+XzJsrp2VLmwSfWYqDh9+eJ3Oaz0NFkbe1YBVd9fy7nutsjxLWZd7soNQuYCrS+pAUoF3LSOd8
 BRD8XSUMz5qwa6HGjGBAV0+qcGJdlMlP5kC+PQ0H2sYBwmGnSs5pqb0NTGZm8aKEob7IK2xSNLX
 FAkl56tIQW1SnwghqBU/f4J/mwL7Fkb9zSFAwsZ0yWyy//nvwFv9CYSWq2ivy/fMJ2gR/Eg4pM1
 jw6pkqt4/h39fn+NPaA==
X-Proofpoint-ORIG-GUID: nQpJTtLRvqTbDWbgO6weEoGjDY0dVmiX
X-Authority-Analysis: v=2.4 cv=fOo0HJae c=1 sm=1 tr=0 ts=69d01492 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=Z1Ti3UXaT223yONGORYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030173

On Fri, Apr 03, 2026 at 06:43:51PM +0200, Luca Weiss wrote:
> Add the description of the IPA block in the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 44 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
