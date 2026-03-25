Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB66D346A0D
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 20:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774469305; cv=none; b=qLUcfuLpph096RMOaVphoQsWXCiVT137eu//mUO/XQyGkTW4tvipkBRh31PtKTs/UN60LXtEvyicVMGsmuRJXOLf6dp2CNyHvAGD7cmEDiAVextgb5z3BrqcKUk8RXNHdkdtFHLU6EsBLrz9nyKsrhD39oUwShIORb+vklPdvUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774469305; c=relaxed/simple;
	bh=lD2t1AMxlzRcnXK8iTU1zKwGBKi3PFz6qWPKGrIlIDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUUXL2bUwQAZaXB86KGmSa6qkr7i3QHC/Vl8yLHl40kdBDnqVGRQjSx39CipSFBGhuD9Dzmcbbsqe7UGo2qDlgLXHpuVGpkEQ2vFvOd+vW9+clKU7W5ZfH7E3pC1w0xoab/NrVBt4DFBi0P2aHn49flOxQvXbmZr97CwJMo2OJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QKSJO4vx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XhjRPYSy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QKSJO4vx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XhjRPYSy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH5wN1554659
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 20:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d/+7PKEkluk0xu811L4V4ceE
	Km1CSLIwU5nrjfkgJ4U=; b=QKSJO4vx7rXJhpV2pKIpBT8E1U1AfJ1BdUCegOnR
	kOkQbT4y9o2wrx4FQodSthzyrWATXm79MDb7loobcCIVGnsnTVQu96+8mSUX6C0Q
	iS2r0qMVyUMejqNqpDXpfpWKfgm1sHk90MCs/aUQDw76bsPkG/SIcYAkrHwgcVrO
	kmQcjyRD0rIpcHr59OVFqheVtyiA6PiG8giPbV2bIVGMvD8ebMcQFGXBieUAKJhj
	hnDTDBE+xUX6UOcgn3tVeVPYcfgoHMGtXfNER+RiSY7O6aYWbnr4RryqDGtxZRUZ
	Z6ozCgdxPQ5MD/edpSFOxt5yINstAXrTn34oRbBvntYEvA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4gj79gu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 20:08:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090e08dcfcso6238891cf.0
        for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 13:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774469302; x=1775074102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d/+7PKEkluk0xu811L4V4ceEKm1CSLIwU5nrjfkgJ4U=;
        b=XhjRPYSynxRZYwbCWm77DykOxkbu/u2faJJM7VfyuswVI2m6zD6gsFxpxcbM0dkBsR
         u6HvMOgV+fm+0QnXom1VzZjrbSU8lF4DoncgMTenvPacpHZqAj+zsJKd9g61FPAgtCk3
         mvR8+6DhqhYI4DgVlvzz3dSi2gWgZamQ1h8m+shjWFfTWzAwuhi0DdDpZtd+4SHHdM7a
         bUVK5qVG4L9xqdKTQHdWW6mHBVGp/+IvOwdSbhkle7DAQqwF+zPUrCp5LBpEUxvq5Mfm
         6tM4Mk3g/L4Du9wMA7300NvzDsMVHHb0d2cF0dATXaf7EArNfVlqmF0wdQtcfq+Sma+A
         6Ewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774469302; x=1775074102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/+7PKEkluk0xu811L4V4ceEKm1CSLIwU5nrjfkgJ4U=;
        b=FMYSCPQgbuQ39fiLVgBIopz+5n1Z016d4f7kSaibrdazXuZ+XJDr/++3R1smARBQqH
         oHQH/EDs7P/kIaitLsZ7qtqaCmoABLT7RNZPn1Lvwz0cAovwzNumuQdS54wRkjzhlhY4
         QG7FB+qkktzv+8WFpNpv5jfAQ/qnBOo7ptbJpQJNqsPwD6KP38dUdEST1r/oxJW2c5zb
         DzKXe45I3n2jGLCi5KmbDOl5BnUvglJQGxyFxYubUHMrJrscGLsx1MTpxgTmO9iFIv64
         pdiMEZZL8MUAnj3Isygue+CgMvenhFrRIdxSS4gdMC4QLxR5lURSmuqUx1F5swYNy3I/
         1iYA==
X-Forwarded-Encrypted: i=1; AJvYcCX89RJrCR+oCLq/7NpWJEPNYee+BYs0a/JwEm4Gc2KSUQh0RDoL+QLkbgAqIqZyijnCw6eMMIYMABqr4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDg16ypQVBwxfw+33+F8ZV3Cl5rP67paOvKvZsyQ8X0GDdwoQA
	WGhyG3NYf/WHUmlU7ckC4zsmG2TMTxC2vT2mWKUJzl5ubpsLE8ktZ6q9ELCt/LbIUWmiwssTton
	MooI72XKS2zWEl8vwHTG6cQamP9CigCXAfvYv8sFnuhZCa/jnOJ4bD716oB+vqETx/g==
X-Gm-Gg: ATEYQzwsVUQQ1Suh14RKJyLiMSuaEkLve9MeqTWLD2rT00HTkf2x+MajGQCEWWFf0bA
	omAlOmv6aUsX1rMeCdO7q6KPUr5L1240uIuddGV4nPU/aXB/yy/IThWRpFXVPyR4U1VrGnuuvbc
	+oSIt+1XmqTv1YNq6saVihWJLr5vMinjz+jGrpabHSCs+PagYwKgvAQLINhwb4NGJCxvFAjXeM1
	wolQCgB9bl0oJiYJqdW3p6rDMtpcHKlPaNtKI6Rb55+qPE+VQuBh1dQHwLmovVXHGamWm15Hdt4
	TWdGDFvo7OVSctvgKroM1EA1egJoUbBnv29Ddwet7866ZkxBxDT/GBbm65nSN+mCY79zahUXEYA
	vaczy0ttJkTtcBu14HTcPQp/gbYSHi8gX0jkaTKVETiIGGN7cJbd+XUrQkFSj5dNHZ3BoG1Sg9C
	NDvS3xQcjg8/amXlnmctX1GWmK+orrV1GORxc=
X-Received: by 2002:ac8:5a8f:0:b0:508:faa5:451a with SMTP id d75a77b69052e-50b80cd3400mr69468801cf.13.1774469302061;
        Wed, 25 Mar 2026 13:08:22 -0700 (PDT)
X-Received: by 2002:ac8:5a8f:0:b0:508:faa5:451a with SMTP id d75a77b69052e-50b80cd3400mr69468391cf.13.1774469301627;
        Wed, 25 Mar 2026 13:08:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c5332d99dsm1145711fa.39.2026.03.25.13.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 13:08:19 -0700 (PDT)
Date: Wed, 25 Mar 2026 22:08:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sm6125: Enable USB-C port handling
Message-ID: <kirmecnwddfikawqulzwgkdple3jq7euvl45meevjmak654mse@e4wiaodqodah>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-2-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-2-446c6e865ad6@gmail.com>
X-Authority-Analysis: v=2.4 cv=M9hA6iws c=1 sm=1 tr=0 ts=69c440b7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=H_3iQ2LuRKvP6GoHn7UA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE0OCBTYWx0ZWRfX6ncr3R8l8hvD
 dJMLU6WJfPKD9y8fw868SU5EPh7pIUyYj7Sn5FlIDlPl0WpGNEfzOIXNSK0BYMiB79gSrfSr/p/
 +RR6zfbj5/x08hnztBjTpcJorV6JjksP2K8jsiqb/aTvFUhn0CM16F02f2pkFBAjfK/KOP2xkon
 DMvMrVmYGW4OmGfGA0y5PK1n48iBhaDpxusHnxrUt/D64Q4AQ//tG3BAQHECpygHAUzZCBkclqy
 eQtX+5XPqecLBxFmHIPCLhlWresX9ed64sjFeELaA2c1MKt6Xq0OyEJlf+ugKuHfId1xT5od8t7
 Xave/aKVd0T1l+8OMc0gzuNyIMOEfDLDbGo7thu4mzILL+WkL2WtBre4YYAhgYZQz6cd29Oye1y
 wPt7NkO2wi1Ecg1cXZqm6QfFWTLAsGquiRkS/e/70xroS/beEyVF9uawKqXZzlP1zVStTBeiRkw
 +sICGfuyexgflw60Quw==
X-Proofpoint-GUID: P0Cwxsua65sQDsahSzjUq7EINUsMWtjO
X-Proofpoint-ORIG-GUID: P0Cwxsua65sQDsahSzjUq7EINUsMWtjO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250148

On Wed, Mar 25, 2026 at 06:07:25PM +0000, Biswapriyo Nath wrote:
> Plug in USB-C related bits and pieces to enable USB role switching.
> Also, remove dr_mode to enable OTG capability.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry
