Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438FA25DD03
	for <phone-devel@vger.kernel.org>; Mon, 24 Mar 2025 10:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742813823; cv=none; b=lm778G/+upUTuEZBjNX7NHH00/L65910/ncMg9C/732JVf5NBPvfPEdli5Xttu759qjYeiyjf/iWlbscQY2HoC/dKrfJJpoHo5JucjIF5J9xgfQWz0OGU34nwceQTMhVJso7m5/mPT34w9nmCnzO+EJue9siFVLnIwi+vHjUZqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742813823; c=relaxed/simple;
	bh=w6aPWy+Qhwe/Y2L6UoLVJWUQwbIVm3ZGC63aKmxOKVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQ/1eiUSgrk0kyC7B/rgljvhQV2FajM2Q/qr///clxSEUKNmCoVNU//TRZyojqOHIfPLR5GWVsZzdIwajkAnGf9LpMYCrpm2WMbWi7/r0Uuph/3YxG9ivxs7XRFrjzUCiROTc2b9N38FTwf3f+Srjxv/NVR4q4hLuEXGqa4Znbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WMUjG97C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WMUjG97C"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O9PNrP021981
	for <phone-devel@vger.kernel.org>; Mon, 24 Mar 2025 10:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e4iq5ZmzgG7lLxopw43AFxoI
	iRiSXqSMGZij+vqFUSc=; b=WMUjG97CfkjZxoEaKgZvO/dE/9TejQ/XF/zAx5wS
	JOYy1QykJ5hriIcNX9mP4zYoYtCrTRvYJjOnGoGJl1ttAYm/OKdsZtPLXNLAseAR
	WPiSXc1ix9qHCn4IRAPPDxWMq51e7BtjneVfwW9tT3EhCMzH5J5IFnVj2IVdLvzJ
	M/HZL/A5UDX4bohIg9npfRnYdoAY/sDkioV0MkJvHisdxkgU93YcqSL7VR2AF3SK
	M2LdZmYxJiFhDdma840K99rgWtMLUoFh1OpOaaawpdmx1h2yY3TwVRCAptni0qn9
	E/gfYMvbR3BGnoREMkVuHvE2RCmCKmvrkJYcrX6cDQx09w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hpcp3yyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 24 Mar 2025 10:57:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c548e16909so401202785a.2
        for <phone-devel@vger.kernel.org>; Mon, 24 Mar 2025 03:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742813820; x=1743418620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4iq5ZmzgG7lLxopw43AFxoIiRiSXqSMGZij+vqFUSc=;
        b=HqUlWs77xJNwewVb4SchffIRjn65BbsmWy0vRVI4a5GlIsKwg6mZcTpSTYoWVdI/V9
         Kqgfe2a+xxauHP1cylmNpLIk5TulWuMxbCpB/PzVhosaeyQTNwFGg6ZCQw87pMGKxkxa
         pX3+Wg6WI+u0On7HilZQJW3UT8FMwzJYkAXLs+LBBLNzB/4/uD1SPMsC+9YloN8vbWae
         I/LhnngjZqlQaEMy9huNIJMJDG6XoNs22cxi141tpxiRydAjOUAU1QpsCl1fqwgIPmGj
         LAaxCT4+SyflVbHjDcitGwa2sILY1vQruVgX7FBXAJ/si0vogj+njcsRPlAYDyJZOIVL
         lGJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQNz2haZAcPKCNs5J3Szkt43EC7Ecw5cHKakQWlWfTBD+Bj5ysR0ZHBvDRy78NW7KGX4SpHrI1QbqsBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTTFTeFNtPaBQG6fAreklakdzW9/ZKsC20GHGLsdrWUoM6/H0a
	wDf4pSafKkszCsrjRAR0kGJm38j2HjBCY9SpKN8jLKe8ecnjceS5+aadGJvNLV5M6XpgdCx5OJR
	dwITUFmFTdWriyPbELaG9O3k9CQQ0ZevP3of8gfcog8gPg9rJkdCsxqUAUKkxSA==
X-Gm-Gg: ASbGncu/O9dxXnpnisl+zID0QUrcaEgdSZ9D7tuwWudQ/qB4Dp/XTKoXv3X35B5rRIW
	T83vR1hJdxJw+w1L2+GPNXlAZkP6Rcv+vnmhCBKImS6Frox7AIE+P1SwRnFMwBErSVDWXIotoCo
	LN8E5st7O4Wke0IZmrFoEkkX9wf+IJ2un1Qlozy61GtELTsEWnjRzT9yQlyBkuIo84ZwG7EUjK0
	ZpI3xaD+RhmeX6nRn4n/7Iu58ChNO/V43/pnUKmpCoLCmiWVA+QFZvMmWQQBOuDaxHPXrwXulbk
	duJGWjv4LGNFGLyPY2UxOVI7PPzH24yuPA0zZjYdy2ejp0opkmYWW6el8mVMlHqzkaMASZm6TqN
	OSSI=
X-Received: by 2002:a05:620a:2946:b0:7c5:a441:f440 with SMTP id af79cd13be357-7c5ba134078mr1404877985a.12.1742813819879;
        Mon, 24 Mar 2025 03:56:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT85bm2iUMTANL530hIieoil1fUEuIlPX9t3T5XtetsmXWHkoxzeE/XwgtI5CCHjlOMTf57Q==
X-Received: by 2002:a05:620a:2946:b0:7c5:a441:f440 with SMTP id af79cd13be357-7c5ba134078mr1404875485a.12.1742813819419;
        Mon, 24 Mar 2025 03:56:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d7e0baesm13193461fa.38.2025.03.24.03.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 03:56:58 -0700 (PDT)
Date: Mon, 24 Mar 2025 12:56:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: sm6350: Align reg properties
 with latest style
Message-ID: <yrxpfsh26ymo74olbgglrgb7d35nj6owkzndfnrbmjorb7tg3k@maccic4kvlwn>
References: <20250324-sm6350-videocc-v2-0-cc22386433f4@fairphone.com>
 <20250324-sm6350-videocc-v2-1-cc22386433f4@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324-sm6350-videocc-v2-1-cc22386433f4@fairphone.com>
X-Proofpoint-GUID: 8i6qpc0OYFfATTbvbKuAoCVJmOmFCj_9
X-Proofpoint-ORIG-GUID: 8i6qpc0OYFfATTbvbKuAoCVJmOmFCj_9
X-Authority-Analysis: v=2.4 cv=PLYP+eqC c=1 sm=1 tr=0 ts=67e13a7d cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=YQ0UDAJD0Z16suNoM6kA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 mlxlogscore=739 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240079

On Mon, Mar 24, 2025 at 09:41:01AM +0100, Luca Weiss wrote:
> While in the past the 'reg' properties were often written using decimal
> '0' for #address-cells = <2> & #size-cells = <2>, nowadays the style is
> to use hexadecimal '0x0' instead.
> 
> Align this dtsi file to the new style to make it consistent, and don't
> use mixed 0x0 and 0 anymore.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 204 +++++++++++++++++------------------
>  1 file changed, 102 insertions(+), 102 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
