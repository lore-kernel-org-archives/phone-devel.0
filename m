Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9135720E007
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 17:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602519; cv=none; b=WEvweqylFke1oIH5G1Q5U1qEfbVxPbL+jgnekpdz/P7pP4RgDEAxPZbh8GDIrGrEGLnXKX37zUJYP9YeYhTOvmYbJbBPZo8WGgslnnrcpOr7Mk11T/rqwhGsAAwYKCrs6ZxK8zj7xyDNAMcpXNxQCDLbGl8TJRj8qWfKFxUPVTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602519; c=relaxed/simple;
	bh=hOAgLBo3rmrxxikvNXsfBO4Ojj0ysk7D3E29Qc8z9Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZp6eXMf6JNGtPtNDfJklGXvRaqOEw/BYkSnM+LfpH4aUk95KMoqvIeEGrbGKt0C534InU83Gfbyo9/zUyIuRhIR4qNGnM3gYYtRtKyHXibt4BYuN9aoC1y3J86TOykvPxIuASJsRelvaW9nXrVtH4CJaBdGHDX5gXv7fz/k2hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aynETfNJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aynETfNJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJrcL012812
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 17:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iYju3EJrtvAUizjHu0/EruE+
	XkPNrQlYf7FCiID13iw=; b=aynETfNJo4fdKRQLlL/4QlV2AkETluH554IM58lo
	bPQZnOqSUYty0GoJ5DUfpDu58qv+1h6d51oT1a9Ku6stXydR0vQddkzgS6IWsS+k
	z5COtFcIgdKWUChDxwFWTr1AlaknUVn5x/4ZKXVJjCfh+6nVDzB0zs4cE6nbPQHH
	Gcu/VfcJsBy2LPTW2i2z9OKU32k5C02nVEgkdhP0DbNwd8JyacidI/K3z5xsdquE
	9ENN7h5MTPWTuBEMIrbBXoepdX3H7Uw7hSFEycTzkWMtwHO34hDOjkErozm5ix4d
	NW2lqnP6yyBVWpPJXMZKq7RJkuApGDPXeCa+SBA47Sw/aQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1sw12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 17:35:16 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8ffb630ffso39604226d6.1
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 10:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602515; x=1746207315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYju3EJrtvAUizjHu0/EruE+XkPNrQlYf7FCiID13iw=;
        b=ex+sqf3/xnjlEGaW8EaeIv0xsOuHj2ZEj8AgHU/y+ag1qTBLX3+pbeGrWZ1RTFG2HB
         8mDD+2lazp9urAA/jmQJa79UO7w+WO0NyXGrpyrXqkAP6OE9KCOK4p62Ea9vL5JVvGx0
         FIxJFYv2UoX/yFA7ZWzOWMxurRKsV8MKGhrteOx+02Flyh3VDACvtlCxPrfENAX60wh/
         8lMTU9OfMR9kcUmZO4G+ikr6oZifBsvE7aAEeHXh7lGMzH7uG3MuRaOBzs3rSwSuaJH8
         1EPjSh/9LoTVasC2LCnOFBbdY4EqrS7KbYkVOK8tpbdxO0J6kCrUUsc64r2lB0toFBsZ
         h+pw==
X-Forwarded-Encrypted: i=1; AJvYcCVm6zsBBKuSehx4qCgIVf1uHVzOZ0Fma2z/AT1h5zsH+DPS6sZXZ6xjUnPQ1V2QmaLEJdTThoM/x8b/gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzK3cF3r+5OwIG2OhzRgeFERr8bHT44sZvTvMkKLWlkZXMCC2B+
	KUVnK6FfCAbmGdKp1Jztx7OcBhnCW1clrEHdpHOicgidaPatjoepWVF6b5Eyy0q64N3NO66sgot
	ZLRHPz1lP+tkbkEM1RLyrS72rWXg78upAEQdROvOoN6nbBgnsheywKaXieCe1SA==
X-Gm-Gg: ASbGncuCCn4NcRodtUhbyJNrt/NftsszGUoFDle4BlZjSq5p6ONmxEmYD2wTHQ1HnKI
	dfLVV7H8d+w/tfQRbmrOg6bnXYIHhIODxnHYyINh1UQN6ryr8c9gjZHHCBQOaVjx1O8wxxrvRNk
	AXuZ29Xk4x3MB5lbECfGkEl28pN64ERLKEM7DwDeFbiw07HbyIjC0BCEgR506GBvRunYh+FmdpC
	kFL8CjNNmrws6yVFG96GK+DYHSD9mZck3CgqVGexb4uE7gRcAKOEKr/6ju3foJQkwTr8LMQSOZH
	enDsqw6TLOpCk2I/j9JT4Eb4TDUgHD0Fw9B3VTN2AQ74blnnna8ae0iOjpxjWgiezj5NTtZssqQ
	=
X-Received: by 2002:a05:6214:3015:b0:6e4:7307:51c6 with SMTP id 6a1803df08f44-6f4cba51c2dmr52746296d6.34.1745602515284;
        Fri, 25 Apr 2025 10:35:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJZmtrsMUpGVmcWNWgVpvUyF2Bex7W+EyH/Zif0B93/CxbcE+0Ez8V8EAzdLQZ37qeR4952Q==
X-Received: by 2002:a05:6214:3015:b0:6e4:7307:51c6 with SMTP id 6a1803df08f44-6f4cba51c2dmr52745946d6.34.1745602514967;
        Fri, 25 Apr 2025 10:35:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cf659b9asm8398381fa.19.2025.04.25.10.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:35:14 -0700 (PDT)
Date: Fri, 25 Apr 2025 20:35:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/11] arm64: dts: qcom: msm8953: Use q6asm defines for
 reg
Message-ID: <44bdd3fgf2e6wfmlfjcj4cepooa3g3b3rzwdsatzrkzre5rkll@24jxskma27nw>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-3-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-3-28308e2ce7d4@fairphone.com>
X-Proofpoint-GUID: sF6O8ImgnEcAyGp5W3vLwIH4afUnX7mD
X-Proofpoint-ORIG-GUID: sF6O8ImgnEcAyGp5W3vLwIH4afUnX7mD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNCBTYWx0ZWRfX6C0+zaCXISXh os2tf5yzFuBrRco4o/bCN2Tb5HV7P/c2l6ZZOvBjdP+daSBUjVxKRQQFidKevMki27pyfyLudEg TgWXQ+oZFDrzgX98UEcVKWBFTYSsqV1xBq2OlpIRjYy+SOzcGFIxpm7x0wTX35/pci4/4U5SrtB
 ZbjI57ujwO83mGLYTxA0DDUMVfD6vH5t+F8TaXlA9FQ2j19Xjrw+2RltO1iqN6Md2p15k7xeK4j hfYzg59zViNVnooSxW0mG3seIEJvdkgCwDeM8Zhkr8JQZ9rlJMQGUF/QBkMFJ6a8jJll6EPper6 JBSuFnnDSSBXDFUjAyLvDmvcafbAs/Il3CPtnSi0NbqQy5MmMdibrlgQzlwTfJb+O2GQnLqhlGD
 /bf9o0ZpPoagKZ4ihRNF8moVafSe/6vSuwuyBcLPvK6cp6nE2RM6tuYXHlUq70VDutwgFKPz
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680bc7d4 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=670 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250124

On Fri, Apr 25, 2025 at 01:53:42PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
