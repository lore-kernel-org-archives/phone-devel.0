Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7A0219307
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 18:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607005; cv=none; b=k+1bwSMbDdpsP0fRuBuHeVnyG37qvc7p5HlZSZI5WGzq9sUqGdPLVt/41kJkAk3Cicaw3I/da4CTD2g0xHDqd+AIVvrr/yytx1L6zyV0Ee+dNJ9Y7BnWVEJeTxOCKiaQ5jQG2YPDMuj7hhHrX0g/TVZkZYH7AFKi+LeVezzlrvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607005; c=relaxed/simple;
	bh=XoX+wEa5HhC3hR5v5Q5gpL5U4kgU7elVA8+JOzu30iY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AvnLIkk24lDN1A8zanMoBO1CEO+6lTuQ6Nf0HEirWU6YFARfH0VxqMlq1Tjlphs9jDEQ/wKIyU9Lq+e5BLGxTXfpdwOmUOuhlU/hW3kqnfkif6YArouEv/0YcB1GKEgRPv5fcqOC3WZ1ba8Wt8Cde8DVxBB/hqIJ4uar+lLAeX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ouUzIaty; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ouUzIaty"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJuk5024737
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 18:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5UZacNDBLmuE/Heewz5Xsv2C
	HRXYOHYVhtQqphnjYro=; b=ouUzIatypmp0mRtlrGmCYrQ8qyI9f6n75zu2bnPr
	khZraYBacLCAhE6QCJM0u74MEGkz0jO0Q7an2a0sbYb1DaP39NVU0ppg7FjUGx+J
	m5yOxqlhja3PzeQkM1cS/00MdWVZBLFE3M8Y4mXLRSVQB36c1alTfeUvFrsw9IX9
	Zv5+ndF7FNIyqJAcbzh6iH9iNFYDtB6a3BHlBeAHCneYUpGZp2i1yezrp61UlMFB
	w/0G5XLcAGMd1wh08/951vOSYDOZfK1poXmnMD+e/XVd5bWLEQLklqgfg3UIRPwL
	RVUmc2meY4NxYoHM9dnTf3vld6NBLKFljAqy60BIxEXwZQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0sw4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 18:50:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5c82c6d72so432551585a.2
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 11:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607002; x=1746211802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UZacNDBLmuE/Heewz5Xsv2CHRXYOHYVhtQqphnjYro=;
        b=a4U2zbmK9kstNKoeO5hV9DcK9D07SOJyZLklq8y2xgoI2nJ8fO3ePVGc+BnJpUK2/i
         Qe0+5G3LyRzqwfbO1D3vtWfI4u/oXBuLkECwmB+Zs0dbb0MC0FEb6VbkhxVC3mzy/xLa
         eA8yQLJCefaGVM4LsqNtRQaaBN58yauOAGTSgqr9c1q7Ml5+uHoJ4mqo4cpgPQvPfo3e
         WIVzTJdJEixj3oqAOM1I/8sSFFFlnoN+83KPR64spguulmyFNo3DCJ22JNQMIBv9Ms1s
         fAJ8ym2dB0Mc7IUzKwlvbfvnJ3svUzUlwC5l0JncjF5ye5wYWpm+IRK/3nCAG5q3FALK
         E6Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWeuLuRXv+jZ7J5nlh6pGhN/3UAd167Qi8RqcnJgnTGq475emKHg+Et/P6W+kE+0gAvpTOdBZxWXUQD8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGxPiJesBSk/TS5nzCMy2J+C57xeao+kRHQe0sMqWHPGo9J480
	+VFFNk9vP76ZzI8qgrQ02OgKS7vezuXIsHWzixsok+rLPiYSi9pJJmcP9cZK3Bfu7GMVvDLa35r
	zPgA9Cuu/SzSg+RBcfah3hcT+IJmtdBEmaa1TMJuStBVq40rOLekSqQ8ISH9+UQ==
X-Gm-Gg: ASbGnct4Yt6JlyAfOAOWIT2Jpz4I/A2qTFixk5lRJbVQ3v9/oSPnNnjQehHnb4O9Uls
	0FXeDPg2/vIL3v19Iv1G2hcHTRg9ZE7qGMMyiijfE5T+iifUKJgK3XMqIXaR9HYkpGot8vU8ARv
	QbNBR+6bcJigCOF5ixJKo8/Otvn9pVrfgENW0IPjxG44QXImshnS7crIQkNXDy88fVV8nSndk+I
	eVFiImEHSVk9OWp47RStOf6ujAe3rvmIIHKRj2DzBcaIwLgGvQV+MF99cxKQ/CrDRhuvTghJZ3u
	+nzLnD5kkbQtGs+vUqVu09Berx//R7pJvVE6yHN0MczUHeK4H+T/768yf1ZtWAWv/Cx6sJU59Gk
	=
X-Received: by 2002:a05:620a:1722:b0:7c5:a435:7867 with SMTP id af79cd13be357-7c96079406cmr478379385a.45.1745607002341;
        Fri, 25 Apr 2025 11:50:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKGFKhgTNVIChoyaUoWx/RSIrv5FxjCevn0K+xqfxGKoAvvW3lf0EQM4tiPmcCVL9Ey+Vj2A==
X-Received: by 2002:a05:620a:1722:b0:7c5:a435:7867 with SMTP id af79cd13be357-7c96079406cmr478376285a.45.1745607002037;
        Fri, 25 Apr 2025 11:50:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d0019716sm8540161fa.48.2025.04.25.11.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:50:01 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:49:59 +0300
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
Subject: Re: [PATCH 07/11] arm64: dts: qcom: sc7280: Use q6asm defines for reg
Message-ID: <c6brmbdqfp4kr4unp2vici4klzocwnpawxdl2m6g3farzgdlvf@2w6kd43oa7sh>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-7-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-7-28308e2ce7d4@fairphone.com>
X-Proofpoint-ORIG-GUID: 3lXRl1jHtK1SE1-ncxGnHStzGYoS7m7o
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680bd95b cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 3lXRl1jHtK1SE1-ncxGnHStzGYoS7m7o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzMyBTYWx0ZWRfXxhP97UWJJQwi 9fv1my6LVXbUQ4H5bS7yo5aUjwaj4nzJv5q8pkJTB3B71PG2TvZ+ddGUTbR0O7u6YmDbGkME7QA beMWqlW5ytyOr52deBFeBlTMyUE4M9yrENNKbbMG/UFrUjJEyezcU79KBBvsJgU5cC/0QpnmGts
 i03OmNw2YuxAbWo/DH1MAD40SVxVv7dYYkr3W9HSDe5n4tCpsxYp6P5r9VQqVSYfczfxCSayErQ 0LdE6OZ6t2YgBSbnP5a8lOAOU3Pet/17Tm9cR6z2zia8sAQxDpc13tlcP+2rbxQJBvbYt8Khhxg 1cy5FtTqE4npGXEGFGNwnPa8nbEG/KByNcy3gXFFgcMw6TD3n9RPyWcz38aXavKucTqwpvMt4hn
 T7mL9o3mFX1kHlEgzvJ6Ynn4nRnIwY+HEVQ3oUKan6iun2ydEerHLUHjX5RYcU+coRPF5UWr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=670 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250133

On Fri, Apr 25, 2025 at 01:53:46PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
