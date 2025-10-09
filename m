Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41D42EB84B
	for <phone-devel@vger.kernel.org>; Thu,  9 Oct 2025 14:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020904; cv=none; b=V0GZAQfpL3S2X6Vkpphjh0XbRIAhiTEvUq7pJkSAgC2P3XuUYB6S5a+Mn8FZxPBB2YtVdM4rxQBZXFtknBJL30caKuGIMmRdJNloW3xIgx2IwTacC6FIFxnVM19OolPkzvMMYwfM2esefu48tBSIu91pAUTgUgJoLsIsNYkQkWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020904; c=relaxed/simple;
	bh=HclYgnPF4LRbdDLD/Q8caHudhorVDWjtXDMuv4Ilhzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r87k6Srnwgcll+AvSsyH4wVR2zPNqvaN3cMFqVAJyX1tRXSx9w7K4uhN+JTU24Owq5s09NXGbVHxoRutgVBHE50Qnvk3vYZPq08MRbm6bWWzqCdDMyyJTzkhSzqnI0udnXO+nGEauexnQ5xdLPCC0hAq96xrXlCN+CqYAdVdKEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ep6+HlCS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ep6+HlCS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EdAO029972
	for <phone-devel@vger.kernel.org>; Thu, 9 Oct 2025 14:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qZxbfmQyGMX+bvx3enASN+Ih
	rNAG5CFfSD/AXrL+wew=; b=ep6+HlCSyQOJYq9gMKv7Lf5Yl4AvI8mXKlrQ9mtn
	3hF9uNIa6GCVtHHdvjY3B6y5oZQMwgNIgVgyu2nHqdCELr2MAJPaZe5o8zG0xmGw
	u8HSoS//g8O1z8Mcf6xxBwDGRbcunC1WVr7XI52fb9YR/GymuZpRltTVHt35XeaC
	VBmS1I/uKOi8WteNS+q6K/qEVAvbKQgJg+FV0aij+gkvAI+Sijy+LDSNcr05PVmK
	guTCqdFz4PwY3z12gCIxN5nJ+dDAEsBAExvH1Ao1SPtpvAWLRjP1dlFFF55/1YVL
	CHo7LaODkouibxY5AUaNgZZ+pFnkX/vsgFxNbr39bbDm5A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nb7yv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 14:41:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ddc5a484c9so38273271cf.1
        for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 07:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760020901; x=1760625701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZxbfmQyGMX+bvx3enASN+IhrNAG5CFfSD/AXrL+wew=;
        b=RYfrfigdhF0hgLZ91kt8v7V+VoGfwZ8FoLi5UlZtDw21btPoIwTX+KQDytABeAnPP+
         9IgYjlo4FK2K3ugGcNyeVk0IYXQw0SyFAMfY6WtbUuP9dgk7Ff5APOkunXxv0KTVU/7r
         9nGmCA5yWsGrfdKvarbJWiVH+gxzLGlPuZETdMV30PWDh4PUPfCl2amh2ncVZcDAPP0Z
         F0K0aGwCxL2ZpRzcrFcWB5Heuw5E/OyV0Tm4qc7WeHO6wtTw11QckAVk1ATs1UmVC8pK
         gDhEKKQfjqemhBr4MtRzZNAi7AtZ7JTqulBUXG7gM32B8qzUYtLQc20Y1eHv104619xU
         Uzwg==
X-Forwarded-Encrypted: i=1; AJvYcCWa86Rae+Ew4XdfHED79mxEGZZgMmd/AhHtM7rivyb9bjpPGFqwMY1jm+m7Hx3ZrxI7oIPY8shDhg3BBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1XSie7koOEP8Jf2nBNQAFAeDu6Zv8rO6kzcsULbQAb4f8Tfrz
	+VRNBkxK4CcXeis1OvjG++HYSDHHQxtCCUwcuoZRdjf2XPhEproZCegcDYR92yXx9VRd42F2W44
	PvR+XYauepVbS6hnkP2wgpBhbpfWL5juhHAZEqc55I7VM0HNxfRvja9dOXS/FpOkulQ==
X-Gm-Gg: ASbGncsmHs20nbGBAGohaltZ6WpWeLJpaJhXmczdqYe48cw1b3LAmVoPQALo4R0j/Yt
	/o1CUkMA8VwI2VjcFA2Eo7wnk6Z2Bz+7HSx+ovE3vb2DKkZ/b0hSNNM2O2fajbe+pw5TQvKHkcL
	fJfFeIiT4ZCIEU95cjDE3yLHzps5bkVy6TP9mtRn/BggjetA0m1jRH4N8iClQXwNfRO+yu5kq7w
	yni40WFtRnEfVc/A9am4pe9Jff+zaPPb2rvS7pTmzz7OtmQQRIOIv2aMkbc+BsWecgnWeonAYdr
	vAGj3L4/PLzBSlJ05xh/YqMFm77MEsm7pwpao7QCU47deUP1as32O0CPE3mLFS4Kn/dHnT6kyWh
	BPk7SjHeC2uj/fdYSzuTHXz4aCN1T7R+nq4nw6pRA7+3Z38qWjfUZ2E966w==
X-Received: by 2002:a05:622a:507:b0:4e5:8180:d4fa with SMTP id d75a77b69052e-4e6ead4a78cmr98196591cf.39.1760020900796;
        Thu, 09 Oct 2025 07:41:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv0mdo3za5+5FAlM5CJ7wLkbh7iaSVKM8BbIGVMwJLYVlsYxxhzIKo+VojFEtceXLiOMhU7A==
X-Received: by 2002:a05:622a:507:b0:4e5:8180:d4fa with SMTP id d75a77b69052e-4e6ead4a78cmr98196221cf.39.1760020900338;
        Thu, 09 Oct 2025 07:41:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907ac1f095sm1108654e87.37.2025.10.09.07.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:41:39 -0700 (PDT)
Date: Thu, 9 Oct 2025 17:41:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: qcm6490-shift-otter: Enable
 flash LED
Message-ID: <b24tiwwhie34narc4u3ez4le3cne3whjtxaccm4xtit3wldumb@ipgsccain72f>
References: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
 <20251009-otter-further-bringup-v2-4-5bb2f4a02cea@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009-otter-further-bringup-v2-4-5bb2f4a02cea@fairphone.com>
X-Authority-Analysis: v=2.4 cv=ZJzaWH7b c=1 sm=1 tr=0 ts=68e7c9a6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8
 a=kDRJMEyxNqLK-ifJ8_YA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 6SU5TPAHtAkMIfYFeNoXs2_nxFB5q_ma
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX73eHLT89LV5X
 sGB/YahFB717hP9WX8O/m4fFAO50kdWcFq2hZ2nt15+BPC+ouxyFhqvj4hW9rhZ2L8nBLJxZxbE
 JsirqsDE/nWu32OrIbGXVy4/NINq7onBMcxuvWxdie1fqU4rKgSYvbj+hAiZ/PwcU5Ly4qx9Jat
 GhcCoe3mFnAg2mtomOm4vz9ApaVg2QlrZNPoP3/nmpAZfLABg9BPH9O5SdyWVA9tFD3TsSXRvpW
 c9WFPcPV6wlOXBm1AKTMhBjJLyVX2EVC0GOzvHY4u7w52b44TSpya6nfx/YOQG1OaqwyakBDUd1
 zN1604AovmS/mUFkrrV0fYbXLqtFFCTnaggXV09asadIo4QkWyOdbb1NE2DJJLhZCbocforiNzF
 Wr2stx+6+fiWG8fH/RziKbbVg4w/1w==
X-Proofpoint-GUID: 6SU5TPAHtAkMIfYFeNoXs2_nxFB5q_ma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 11:06:34AM +0200, Luca Weiss wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Describe the flash LED on this phone.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
