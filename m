Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6298F49
	for <phone-devel@vger.kernel.org>; Fri,  1 Aug 2025 13:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754056326; cv=none; b=SY8/vZu0uqN5/R09R28M9EP0Ht+pM2foU066MzQgTmJqE2Nl9eh7eKlZvCLkZ4UVEBP5BNzYYOTiEPiUDJvlp1bQTNniSfXi+QUHz2rotXFMCipqMVfud0K82CnmE/s2r+QQiGG1qJgOKaYZL5jynopxcJkszITxWHArrCTNvQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754056326; c=relaxed/simple;
	bh=vhTrP+GJIoA6ydMovg9Eb79KfHnKL5N79rl9tjjQND4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMBm4ltM9aRAOkxmO+l/EuSDDhkN2JERJsFoRYGjxib3M8i0CdZILrQMV/c9oQhViIyP6YnislE7lq8iTNVCLPdQ5AuhZw2Zyzo1E2DjPVF8CIDaxPESA63g3AHLAEagUkEwoGP29Md+NVjU3pwsQKjJm8zwIXgnW7GtCbSZlgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bi/O9ZFI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bi/O9ZFI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571750rR013642
	for <phone-devel@vger.kernel.org>; Fri, 1 Aug 2025 13:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gN0kT+Wo9uqVQiZqrtrMEVeC
	TpUgjT6nfQXr88CiLMA=; b=bi/O9ZFICWERMwdfqU3CSHhfOZ+dZ2SPf5u4IBJ8
	STMrTJ5V5x0GInC3QxbnkNiC6D6/zlLBj7wADw7+31fOJAr318toyHs9qsOx9SYw
	wgXbsKChxFQliYQnXco4Hgr0XpStXktg7NH+HoSEFtTK/tqH0R2dzpd8kRESIIQf
	qaB9pTSng4G71fuxDFPFlb9qfCixlu/v68HdTroTU4Rw+ShNTR48SPgDI/tyNKO5
	oAl6t8nuZ831scdlPytVI8qlsllaM7Hln1omTN811t23/u7m5aEsZHBbfGEzC0Y7
	TWcNQLn4t46fnbuh1BzqnIs8uZ6TT6nDBkMRNMdtiMoQqA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2uvka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 01 Aug 2025 13:52:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab6cc9811aso10843021cf.1
        for <phone-devel@vger.kernel.org>; Fri, 01 Aug 2025 06:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754056322; x=1754661122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gN0kT+Wo9uqVQiZqrtrMEVeCTpUgjT6nfQXr88CiLMA=;
        b=gBi/6yqDfr4aqNAyNIHF+ANeMQK58nkPzHmc7CmRjLCOlU+zMkfUNnTILlQYmCVaUD
         liL34xzNTrHHzhWckXH66dNh43ThcFex+XfeOf1bkxCWA3kSfxR3D32l622G9/y9sVt9
         Ak49f2AaYUUbT6cURISHGRri4DZoeoH78AJ6idrMQ7b/it5AoJcc5KG7tdg/zvXGJ/uu
         jnHi8ow/1d+VIRmDUA5E+pkCpP8uZvCaNA35egBp0jZ6Y8cTSKK7lwid3c5yPr8eyONB
         IDyIN4bL2tpnfFM4mewq+bUBHISGjK9/t5SAfut/mcexdqSRfal8KdyJncSQp/vno9zE
         QLgw==
X-Forwarded-Encrypted: i=1; AJvYcCV0zlC3d+VJ3l6OPMmkHyR1xnoFjiv6TDRzyehNk454lmxDr8NIhD6AXAe7DDbkdlWymGa+TYqQ/ffHZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk5l0SPIzdrdT67HMaoFtW9AiuBk4iQB60HeAS69yGiMcVZKqE
	YqfVRCCSjknyHcdzRkMC4rcQAF0jvw7i6pnA1fTX77JFplH/BK/NzfrLJAXg0tswx6aGDHddZW7
	k3hbWkR/Y+hUjTFgScP6SDv9nGDgKxyplB7kgd1NRil9yZezBpPA/Nrd7iq3PHcPnkA==
X-Gm-Gg: ASbGncstTT8MBsJeQ+WWjUZoHWDhgLuNZjPpOWKb1yEjtp9K1hhsWc1ENQTF3d20xWl
	sYQnTnvNwu7jpHx+B3Hg733jhfiiFiZrT07b8376+2GyPJvoc9S21Ci05JUfbufyVh7GSJ1ENYH
	pClgbvsp4WOn3TeBt3P83naZKoHi8NXi732Le9LbM6cshVbCTwUSc24mmhHN3xyXMbruRy9UZcr
	HeMauokVhSbstL6WKik+ZAqQOHeKdGvDSKNwY2xqBRTi00wM7KUeiu4JeKiiiCOXEPhr+lDV4s4
	sYBD5hwlVqK2jwovpKsO227mACmixZpTJ2xQqe+oHq9gdTogld4snzag+4KOPFLKPLWu/dpJPiN
	1m2ffjzW+4EnwuCQjgaNaUbnvzmMJORJdNm1rhR652CTr4YgVLOCG
X-Received: by 2002:ac8:5fca:0:b0:4ab:af74:e0be with SMTP id d75a77b69052e-4aedbc59deamr162312811cf.43.1754056321929;
        Fri, 01 Aug 2025 06:52:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbJ9/UfCMEp6ALYbfsnGI7L7qxlBrcJTulkDzMGsNnw0pPYnM9xZM+cCoRA4uOKSXu3GzEkg==
X-Received: by 2002:ac8:5fca:0:b0:4ab:af74:e0be with SMTP id d75a77b69052e-4aedbc59deamr162312451cf.43.1754056321484;
        Fri, 01 Aug 2025 06:52:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889ac5f5sm603568e87.64.2025.08.01.06.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:52:00 -0700 (PDT)
Date: Fri, 1 Aug 2025 16:51:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm6350: Add rpmh-stats node
Message-ID: <nn6p367tg4l2qi6277rclxrbk5zxzoelzeoxvl3exgbjabjoxd@pujfujycift7>
References: <20250801-sm6350-rpmh-stats-v1-1-f1fb649d1095@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801-sm6350-rpmh-stats-v1-1-f1fb649d1095@fairphone.com>
X-Proofpoint-GUID: xuhI4nbsJRiCKzHDCrNuGB6oqXK8lEET
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwNSBTYWx0ZWRfXwJHM3PxvlDKo
 qqAaF+ZJt6P9B4NRj7d2we3p1ZCu9g3xGOm6YH2i8bMK2gv8h74zRljEnr6e6C+cy9798ApcNXG
 8FHWvc+Vk73x8opAPnozT3CkVv3k+DlrjTkA6HYxgIlAul6wAlXTtNEcrkixx821rG1m2Ujr9fU
 PcTHHfmYSrBXz30X90DcFBNM3TtGTb5a9g3R+EFpKuolt/Bi8a3W6xCGOjXjsIcUnAgxdie918Q
 g6+CyfSfTnTtmMpcYXEwaCWnULfDKveVYEPTmUN+l0Akrb81CLCCOv6R3C1Sx+A4dt4w0Vtqf2w
 QlWxsnrYBOLaR8QpBuQJ6P+5I5R/sJSjpMB+zBk2FVraVIFv+bp3KRo/6Zx9GaMZs7KJYVpnFn3
 P72HbF/qyfeMHm/Ixok8VGE72TfQOKGphCbfLG5S0cm8weZKWlfx02yt20fXtaX1me1rElIn
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=688cc682 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=NGnrDkvxLCtUz6Rj-iUA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: xuhI4nbsJRiCKzHDCrNuGB6oqXK8lEET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=930 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010105

On Fri, Aug 01, 2025 at 03:40:59PM +0200, Luca Weiss wrote:
> The qcom_stats driver allows querying sleep stats from various
> remoteprocs. Add a node to enable it.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
