Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC481EDA0E
	for <phone-devel@vger.kernel.org>; Sat, 30 Aug 2025 22:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756593141; cv=none; b=poVKfjZzInhUnBPkL/EwoqLhWU8JiMi2ThRcm0MYTGUrgNCGY+/Lz/q4nWTzhfzBto9lq0zxr/e9ZVgeG4NMfGJHWuH93HzrxoOLliXia7aN+odvz3cYWiyc5WgIHp2dUuGfuk254Q8jd44N9JwX/cOVUTekcrExXPkpU7lCsI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756593141; c=relaxed/simple;
	bh=us7sRr8yLEdHvWlleTM+BBqy1U2+fJ2VNFkbnU3OltY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIT6rnDqQXzA6jUkjLZjzm8lbp0ywpoNtRezf6wLxNMCOPYenmnFYxoGuF6bsFFXTtquqBVMm8yAxfwZPKSjeQQouA/PQBxU8LwTo5bfpSpBWY1uWiJnnyp4dclREAFqPgg1/dO4gLgxEljKup2nqqBSoFBmggqrexCr4/eoghw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IilZchI7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IilZchI7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ULtogV001418
	for <phone-devel@vger.kernel.org>; Sat, 30 Aug 2025 22:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZOk2Fr4etXqQXWWu31+aCsK5bvdOnYg2L2JTOXhsW8k=; b=IilZchI7fwzK45sv
	6CSw0jKZI/ndE+4w/eUCgnpqt0zlgxidPaGtbEAJbrAbynjUZ4uRIv3xoHzXjGUG
	+uPGmJow/gxmNlFAUMVa+Ip+goGEEwvmot0BHYb6tDLLTsALdShWZHZz3wQA5Ned
	Tivt3swz3mWTkiZdq3GWqlTN1cvHZonhDBMia+si2FWBIGPza7cR16YWhHBOBcCK
	6A+z8Xlo2TiDht8v2cJUbTqRqI74wB36exG1y2xicByn2bPQwEbkfM0HmjieSYH/
	8r65lN6OV450D1ZX/n2U8gxlyZmOoYxVnlqJeWslrYHfca9olQgV6qcgVodUFGla
	BaUHww==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk8s4yp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 30 Aug 2025 22:32:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70faf8b375cso15824216d6.0
        for <phone-devel@vger.kernel.org>; Sat, 30 Aug 2025 15:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756593136; x=1757197936;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOk2Fr4etXqQXWWu31+aCsK5bvdOnYg2L2JTOXhsW8k=;
        b=vXyPxeUu31cWjmLy/M+GMCfw9re6YFUyvm4RdFsIzaNT6rjLVyHedQg5ixEHG7GKns
         u/95wY3jKac/fsECJNFoEezBeSkR9NLGTCc9rVPDj0PopkzZ1Ln6OTNmpfTRcnRKWSCN
         YgOEuX83ntP2yYMRIX8Zys5YnMPFzi9fQLRTNsTpqWmd1RdouoEBmQs53GkyPqUckhm2
         LCBVMvr5D477UubANOm1le456iEOV98mvxfmsMP66uuou56kIuZfgU+REMdbbZv76R0n
         Z1aT19LgR+lVduVA0OIY6qjZarGMENWpjhajOwghjFg8c78MA6cnyHai5TptVRSxAGno
         Iftw==
X-Forwarded-Encrypted: i=1; AJvYcCXFqDgLeWN7QW6/ZFaAJhZ07SS7RLqzgRoIYcXNUrjcoP1Mm9wOCEhips/1ePN7osltEilsWX9W1m0u2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZegaViGCm4sl8YS2ajDHJ32O0bKCtcXVYnRyKiyZPB0J6iNIz
	Ig3mue0oT8Y1DTypT/X02VHD9UHSN3K9G/fxQ7i0TGSSHMqFLl7nsfuJriVTEwC44jCtBhfLZr6
	GzFCXnh8d/NjSeJhjJtp48zW1K+8B1XYS+B7lM0RTRPYd0BQ/Ent8nCtbM1OX/X0NIA==
X-Gm-Gg: ASbGncuFLKxTswl/lZQO9goqnHOasXMqzjMcgMeWzqVPrsEqid7QzptYpfQVh617UBk
	ZEqik3PdjHWV7xLS5idwIrqXBPoZmId8BDRVOJWoQ0MmHDlv01su8+X6dBayne0NArTein7jHVf
	O7Xr5yrEFLxTxD+6TtMQWsvb0tE+p2oFD+8zyeH74Pr905pLuO7V05B1vUn+WC69C8HlYrcWIbp
	lq4mg8fJdHF/GNPlAoOoUYbij+yO/dUBGkY61GVo+X6E2s8b+7XCTARPZpKIGeqykahMISNQZZn
	ZsQImsHs+RULdRHHN2n2yY/W/dge1Iyja1pVEqBt1O5gkSUR7oFobEE5wxkodx09aSC2UP3yD13
	JrdAFVc4qo98f8eNa3VdL3d0HPbjIZe6sDu6qG8y0rGZlO/2cIF8q
X-Received: by 2002:ad4:5765:0:b0:70b:afbb:d667 with SMTP id 6a1803df08f44-70fac702598mr42924166d6.7.1756593136385;
        Sat, 30 Aug 2025 15:32:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHR9Jdct+dl5bztXAQ7MPjTRcDYv2SEdv5r5sALsU5a5Isqo/P5kseYL+FWDWZOGBYsglJD0g==
X-Received: by 2002:ad4:5765:0:b0:70b:afbb:d667 with SMTP id 6a1803df08f44-70fac702598mr42923966d6.7.1756593135939;
        Sat, 30 Aug 2025 15:32:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-336d0cb4793sm4700091fa.30.2025.08.30.15.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 15:32:15 -0700 (PDT)
Date: Sun, 31 Aug 2025 01:32:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH] arch: arm64: dts: qcom: sdm845-shift-axolotl: set
 chassis type
Message-ID: <322qbrll5nwg6prpj2uwiqjvk7lmboibq6vlklguxtfpw7547j@44df3kxleua2>
References: <3e04efc06a795a32b0080b2f23a138e139057b02.1756569434.git.agx@sigxcpu.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e04efc06a795a32b0080b2f23a138e139057b02.1756569434.git.agx@sigxcpu.org>
X-Proofpoint-GUID: doMia3TGWXWWJfVMQGfAXlw727I7jE_i
X-Proofpoint-ORIG-GUID: doMia3TGWXWWJfVMQGfAXlw727I7jE_i
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b37bf1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=ze386MxoAAAA:8 a=EUspDBNiAAAA:8 a=zp4TkvOl8oPtFYFRJokA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=iBZjaW-pnkserzjvUTHh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX7qt9xlHkpOfg
 x7WEL/o4sE+LRsh7Qm1D4rUdWwfyszUEQKplPvQJqpoy7k+HEqYvB2qC8mb67Da5xDilVdCa9sK
 I5CXLL9tCQGGPx/opyTpdOPxTk3ii3fTmmfGiYk3TlVDh+KTvK/MBByg4DhTvkRLV6Q++5ri3dN
 QVE7vlHh8kQ0o/EALkSoYGeFvmbMCV3MO0090rvgP7EjNn9iuyXEXXG7krJM5oPRVBW331OWFi9
 IEmTPJsS9EFPN/8g/GOPOmfy4oq/AJFCsOqrCCGnWp1POtqmbAhRXgWLHV/z2H3P5cdi7KfXz5a
 fRqTaHABUHD5Z5NirjSRDU/QoNHWe5bGWaw9GECfejI43R8D7B88/R2q60xK++hB3U5x26C/Ja5
 Zn3Qxqal
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-30_09,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

On Sat, Aug 30, 2025 at 05:57:29PM +0200, Guido Günther wrote:
> It's a handset.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
