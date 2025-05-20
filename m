Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC893277011
	for <phone-devel@vger.kernel.org>; Tue, 20 May 2025 19:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770752; cv=none; b=OydDcnEzuVoML8TmjA76610ZVMr8aMOkCo1oB+aC/qPT6JciGSbQiujndz5uOyWms/BkYUpdj3CvaYB4T28bkNtMpfONQl5k2j7ZMINbp33Ms8tVU1ULvaj5IjMnZ0c2+rsWvgOsvlAw8eBL9IQDCO5DdhyYsdIGLms3ySIfL1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770752; c=relaxed/simple;
	bh=fhwrc1tbFQioZ+O75VVgYeJFQo/oxLMljz6u/pC7sPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBif8dPXMbm2SLT/JZjU4KbHAD7lAKAlfaHHPoXPyKQNlSjPmJRdG3e+O3WDGrRPKCJsUunijWJOKyx1qVEiGGtEzUZAxtrmiYPqVhVtJiMxwtOBdMvKdtymsQwQ2kXukrjItPEdo5WeXN520Ig+m5QUBa+s2sthCP1klDwD0t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTYOeZvH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTYOeZvH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGeD5c026861
	for <phone-devel@vger.kernel.org>; Tue, 20 May 2025 19:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YFL2XC8qzId5Dd6D3sundaqd
	2zkC9xDf5x4zzleSYqI=; b=KTYOeZvHmpbm0b1biMqZxWJQBdNnXPFYO9mTYhsT
	YPWuEUZ78DJEGA//OB9ZmFNK4J008bld10zwULWTbl5EwKlw9y3RyLVMPixW/vCo
	WxZaBXkqaa42wX11EirEuqi1VUen5YAMEl7+P5zwo7SxUqo0scO2tC/foTx5AMWm
	G0+4iT2ibWXTylRobSarSg9/5ivuAv7ywshzMgrDTsrppE/rGpOv4Hzu3aw7UlCi
	aSGrkcA5LHta2RWzukcQajKrbb9JchY4ETBoD9GDOOSbnVLIg693gmlLhMHSXYVt
	ZnU+vIE28wKqHw4XDzG+85Xw3j0cNT8CbzF+UVbiUZ/GIw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf98fth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 20 May 2025 19:52:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c955be751aso1095831885a.2
        for <phone-devel@vger.kernel.org>; Tue, 20 May 2025 12:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770749; x=1748375549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFL2XC8qzId5Dd6D3sundaqd2zkC9xDf5x4zzleSYqI=;
        b=IC366qVibnMjDBwq/oIDmF798AMzDJ2DQy8VDsO65058GNfPyEoccDEOFCdhuePpml
         c91NxlXP9Mo5NrvBeJnKfsQix78xVHZBaLkgebcYDKpRiMGEJucnAVokktNErt0G8roq
         jkcJoEo011BftCkhpEr68gBQIfzizxEtyxv/5ngbKRy4JLyTd71SLKBNxkYu1vbF7leD
         JDgi36+zgdFbxuivwpSLBFBUJOcV2KMDJhDP9ugBQAaM72jlbOFSSzv5QoGc7bueGCW3
         qrknKQyEd6MLIcatyEeYFvvhGFAce8VUT67s2mzHKM4hhv6Oa/deS7FbkB48UR1uC/QC
         52nA==
X-Forwarded-Encrypted: i=1; AJvYcCWU8peXlxM/sw6mTMpS7mhr3JH+cQuwRQ5vXzVrzioavnOM97i63ayFN5Dzo5xVWk3bg4t4Izy8S133Ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQTnpf1knH/8EOCt9XzDSa5l3B58uMM8w1HoveWXmUiH7KG681
	h/CVLHweIM4mw0aeopMlOuKle/b2kpSNYal2s9OFYzZ1eAosrQFEDqSBEWr4Y6scoXCNlldsisc
	JhwAviQsArvkZrbJZ9OjYV7tbYZi7mWPeWjczFstlW3RAXY4+ACmNPv9WtJyndr5v+g==
X-Gm-Gg: ASbGncuhHVyLmd1PkloIKleOOnlFqzYAFF7VFfs+eMhkj5R6DiAbmwlXmUbKJjZmnV4
	4GkGULfkfV0y6QDmeDfy+pqIoKXJjoSI/wK3J3pkgNoevEQZRwwgjUNYhamewXQHpL/C3nBoLMg
	Umpo7r7ljVUr7f3BSk48M+NNuTihcpRI+k+SSsLWQpmD6kNZXtJn6qOAgtJSsAM1vdcYiJg2yfI
	blngqSivvPXo5lx6cVKM8humUh3cNH5ggX6wDN3AXXC2zOvdkxVaNb0UWNwhKPowVS7uuhoNoM8
	DrmiJd9LHzxxjf/NhPirSAcCz4adkbA3MSLlLxERxWIAUGM7svGRmLg9tlF4jUPM/P2/eEMgqB0
	=
X-Received: by 2002:a05:620a:4248:b0:7c5:94e0:cafb with SMTP id af79cd13be357-7cd467ac226mr3064509385a.48.1747770748643;
        Tue, 20 May 2025 12:52:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEldE9RxymngN0SkiNE/w7R4kBGpcHXriCXVbNFCA/wbxlYIebBJIZ4sUG/sX2j3pgpIKH5w==
X-Received: by 2002:a05:620a:4248:b0:7c5:94e0:cafb with SMTP id af79cd13be357-7cd467ac226mr3064501685a.48.1747770748082;
        Tue, 20 May 2025 12:52:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f1637dsm2462421e87.35.2025.05.20.12.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:52:27 -0700 (PDT)
Date: Tue, 20 May 2025 22:52:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8939: Add camss and cci
Message-ID: <ggx6kzto3qy2blhr5yiqhy37wmgs7c2hvvp4wyfuf4iclk3bkj@7masdrxeaddf>
References: <20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org>
 <20250520-camss-8x39-vbif-v1-4-a12cd6006af9@mailoo.org>
 <ba201739-36ac-4586-99a6-bc96dbf4b0e9@linaro.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba201739-36ac-4586-99a6-bc96dbf4b0e9@linaro.org>
X-Proofpoint-ORIG-GUID: sdwszx6Sf6thVhPCNEhxWlkappV1J5gJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2MCBTYWx0ZWRfX0lvcZxRFrNhX
 ytoU61cdnbXSAh/yu9rYuIND5GrH+ioOXO+Xiwxhj8w/UmkV1p9rmXNVd7qbw/rSk/ZSe6xt7VW
 YP+2jzVUBWeJK0lX8xKZVfEh8u5MYiMzp0dqcD/dw833EeosAIFe9pTgk86cxD8Tago4gX9kTPn
 PDAbBbY+So3mIeZiDjS7ODU4w9VjyzZI1K2mWumYRH7pB6yL43IIbjlYHB174T7khRlW5NRUVF1
 23b1j9ReJc1jtSwZqFPp31NY9Sn/geCceR4vJmtGqIFvFQlgJhoNcxsx3UAz5wAanl3Y0E/l/u/
 KdnxaA9f0tzukSHOpw1QKN828TYFQZ2Guq7O7m6WEZe07BI/ha5SUH143sZC5DRO/33Rk8zGuua
 sBSMfNvrnWDrHdCLRp9uAUjfQM4L/NwbhDGYA4PC8K0O/4jTuarVWXk1yClcD6fZN3ODObQk
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=682cdd7d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=TqukyxIwAAAA:8 a=ngZlcTqnKCSXXy_N_KUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=e_wvXvRcY2B3oMitRgDS:22
X-Proofpoint-GUID: sdwszx6Sf6thVhPCNEhxWlkappV1J5gJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=834 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200160

On Tue, May 20, 2025 at 10:30:30PM +0300, Vladimir Zapolskiy wrote:
> Hello Vincent.
> 
> On 5/20/25 21:39, Vincent Knecht via B4 Relay wrote:
> > From: Vincent Knecht <vincent.knecht@mailoo.org>
> > 
> > Add the camera subsystem and CCI used to interface with cameras on the
> > Snapdragon 615.
> > 
> > Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> > ---
> >   arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi |   4 +
> >   arch/arm64/boot/dts/qcom/msm8939.dtsi        | 152 +++++++++++++++++++++++++++
> 
> Please split SoC specific changes from the board specific ones into
> separate patches.
> 
> >   2 files changed, 156 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
> > index adb96cd8d643e5fde1ac95c0fc3c9c3c3efb07e8..659d127b1bc3570d137ca986e4eacf600c183e5e 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi
> > @@ -11,6 +11,10 @@
> >   #include "msm8939.dtsi"
> >   #include "pm8916.dtsi"
> > +&camss {
> > +	vdda-supply = <&pm8916_l2>;
> > +};
> > +
> 
> What is the benefit of enabling CAMSS on a board without any sensors
> connected to the SoC? Likely the board specific change has to be removed.

This is not a board, it's a PMIC-related include file which just wires
the supplies.

-- 
With best wishes
Dmitry
