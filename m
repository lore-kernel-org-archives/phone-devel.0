Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319582248A4
	for <phone-devel@vger.kernel.org>; Wed,  5 Nov 2025 00:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762304110; cv=none; b=eedg+jD/p/31tkb7R8Y96wNRRfsbjHzNmZZ0MEpaklZBCQ+W4aJtjZIrDlBsKrckH3CRZ8kEVe2KVRhC02Cvt9RU97LkbWW7s2dryliDL0S1ON/MyfLqnGPbb4b7PMRoE+FK+gv3EhlcRLAZ+hTWZeXjVuGqim4lDQf9Xc5j5BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762304110; c=relaxed/simple;
	bh=WMtxXg6HXmX8zM7j02YQAbCGdgTWB8jnjJp35wcDprg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0cFqiMUvbL/qFMm2iomkccXJiHaRg7leKL3h/e+h4cZO3h3NJc1M5+tenVvCc2Otc1s60l3p1tRlifhKcP6OV3QKiv81KRxQp3//e46Z2JfMRiOJrq0P7o17xnsGHiaT6/oHbqWyYLmD2ISqwZ4xGqkFfMmncnO1HLjS8TSNic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I7bZM9HY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K1jCIegw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7bZM9HY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K1jCIegw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4KgEEu3086313
	for <phone-devel@vger.kernel.org>; Wed, 5 Nov 2025 00:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/ADOlbA/MeXRPk9nFlkw4G84
	15r9Bnyhb0LknOuL9V0=; b=I7bZM9HY10F5/GmUHmO4M81orXypz+0HnoGDjVke
	xukl33suuLsKLPZVAhzwXstnM65gkGDZ4p/ZJOvdJZvb2UtX7fiyG1oTr93fqr/T
	/zfRT6jE0ZcvZ6uBiTa7Qc0S0HL2+wG5mxPHPHPResg6SNHhOBeFL+wqMaLiegf/
	YW5geElDoK7n1j16WtdjJK+kLIAZ8NmkRtsW42Xcc8xBmBCoLgKiHa8u3WGJ6iPi
	a9CeyLMAch9cWC/gP+deVxRE25TwEJuuyQkMbjHQLnSWoNtq1w73Ca1fiVoX+YV/
	tk72Sd0cwkiP2AGz7TTQAnaL3IWz38lt4QfdStI7ctXu2A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a79jjuhwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 05 Nov 2025 00:55:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-892637a3736so1948369685a.1
        for <phone-devel@vger.kernel.org>; Tue, 04 Nov 2025 16:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762304106; x=1762908906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/ADOlbA/MeXRPk9nFlkw4G8415r9Bnyhb0LknOuL9V0=;
        b=K1jCIegwThv11w7Mu4oEm7K0LQSHeValvLfD+tvPyqoD5WHPsGc5yqUXdTHW9dYWJc
         OBYgWnS3gP4OjeAOILbuWFZc4Mi51l2RLc9M451QSXvzllQqGVyy+4BaM2kWzSlliwfC
         ttokLO2uugMG6AInWAC57ioCs9LV3ozZqQmwXKJ74F49cde42lUMndfMZ20kR1QFS9b0
         csqUfk/QccYwTmu92WrzKlkajhb7d9t5bA4LHoJvxD8mfRJEt6QWW2vGwLmpmivePCB4
         E+6j9MXSVIuwYdQHLWuOzIp7hXoczxyyzBUcnJwZqyj1EzGlWezeZb/MgVN46LXjXbXh
         8ylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762304106; x=1762908906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ADOlbA/MeXRPk9nFlkw4G8415r9Bnyhb0LknOuL9V0=;
        b=Axr3mCMynnUVGsMjRrGuU+3kdkec97+PtdmHW6X6JQ29ETvVjlOCopdO31KSb8AaJA
         KsEj9qFecm0wzOBmOgXF4FwHfuROl4f80eDfryB6ifCz54+SSn0Wv1pccaCZ9XN+D9Ut
         1PiDFPo7KpBSOAjghDXqoU1+8g7y5+QQE/yvKeCz7NJbzkOkaapHKlG6zTaxbYIKqEAP
         K1yALQcv4uv3fMR0zHuSfEMHzLKj9ZWPzkJr7P0qoMNq2PjfrANoDjFzvvOfphW4zOw9
         EkpGSLsL3/eaCTN8dixUb2u7WIzzaAJ7eSsoWHqJoPgGnwlGea80zq8nlnu5XBRVi+ld
         YChw==
X-Forwarded-Encrypted: i=1; AJvYcCUmakUKmAl8wXzENezg5WrzAutHhwp1IxWXYQWsjWErln5HfiuRm4nLbyLNDdhFmzXZAEY1sp/D07RUhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNIk9lhtY/hHsxetG6a4VwNGvgg8TACO9mmoHw55f/lWlznBdc
	5KuBcMgtHXv8d5CPySjWhwu5c+HoPthA1xIann3fhr83+m1o1PJw1i2GJvyJGKMPCOZ1+gbmc8t
	aoTejijD5cRt0cPvoIvc1FEj271lsICpWrFAYZRzKgC6t9SASgNllJ7T8+3AkuD1FAA==
X-Gm-Gg: ASbGncu9a6XN4NAWDnr1NctxW8gLPc9khbYD405PcvhFs4cl0kXiy2WHwH01artUv6n
	W51RSVj7I5MUi3u5NE/B5AmvrEsEcjEkeLExZ4mFAc+36jAlo6LDmjl+j4ErRtTZlWwlJIb/kI0
	NanoBB4eoTAJI2ZIFi/jKWCguErK98pFIsLSAoi3mL2YdWSEYDQL7BO5kS8NhZN1GTCh2HVuwYA
	JxPHI/XLjS5kRlseYwYFHqjTkGl0yHGz1mW+xxiS4iTtmVskNR+WN6MtT/CgcC4nNbBybqlWyXF
	nWKAs8WRIlqsGaee4WjB8y1d8Rjw9ZfFn7q3H9MWHdQcXfvEdgfLXQSfFWbjBs6TTXTl6WRE1kI
	klMbhuUmQwc2R/uLAGNZO7CDreY+E5sgpQ1nca4Xbylg4bSgSaT/HtytX2tsbNZ2PGRmKKYIb4y
	EwA5aoWE5yXOef
X-Received: by 2002:a05:620a:28c9:b0:8a0:8627:30b8 with SMTP id af79cd13be357-8b220b9566cmr215544285a.59.1762304106157;
        Tue, 04 Nov 2025 16:55:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFl2T8MaBy02VcjmjrLLsEC09nXbRPXngYX5Uir3OVPaxk5ZvRsK2epgIV03aGzl6YxHlPzXQ==
X-Received: by 2002:a05:620a:28c9:b0:8a0:8627:30b8 with SMTP id af79cd13be357-8b220b9566cmr215541285a.59.1762304105532;
        Tue, 04 Nov 2025 16:55:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-594343911bdsm1169861e87.33.2025.11.04.16.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 16:55:04 -0800 (PST)
Date: Wed, 5 Nov 2025 02:55:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 02/12] arch: arm64: qcom: sdm845-enchilada: Specify panel
 name within the compatible
Message-ID: <neykh5ldiksowcyqomqlx7wwdo3jrofpn7cyndgsic5ckcemik@gngyem6bmdsy>
References: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
 <20251104-sofef00-rebuild-v1-2-dfcfa17eb176@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104-sofef00-rebuild-v1-2-dfcfa17eb176@ixit.cz>
X-Proofpoint-GUID: rM7rTFPHQp92IdQLO5pl1BzOSpJnLnzo
X-Proofpoint-ORIG-GUID: rM7rTFPHQp92IdQLO5pl1BzOSpJnLnzo
X-Authority-Analysis: v=2.4 cv=TuPrRTXh c=1 sm=1 tr=0 ts=690aa06a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QsaZCVNBrwfq_IZkOpQA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAwNSBTYWx0ZWRfXwjVadFDMlnJb
 m6V1maknPb6VHXJKAB1WyGf6632ddQ5TXoEgZ+EhsMnDZsBERAg+6J6BHfL+pk1/RmS/1SldHtS
 OU+RG7CvhrQkEUGXaINn5vTF0MPJBS5eqyULpqo1tsxT+vLbzIMGv/btDt/zhk5xhKFqDcd0Q1q
 /fdwu5nEIuwrl5elDN8IfeCKiGQFaA+jJFBiy6Tbl3TjCWYUJ180s2OqgmnhJqvouV2CIBGL0Yo
 czGUEgYFDQaGi7VTu04ft9nw7syYM7mwXU4ktP1aG9EjQi8SEtuvxkTXgOJG1P5V/3fWfPtwPKm
 B832YenC6UmgDbb7Ps6U/m0syUzPCJE5zFgyfuaV+6K0VAkagPHDI5IW5XsdMUgaS830mylcVt8
 /AZNt1rQ7dRzzjPKCfYIRWdhz04qww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050005

On Tue, Nov 04, 2025 at 11:16:10PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> sofef00 is name of the DDIC, it doesn't contain name of the panel used.
> The DDIC is also paired with other panels, so make clear which panel is
> used.
> 
> cosmetic: sort the node.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
> index a259eb9d45ae0..8aead6dc25e00 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
> @@ -31,9 +31,9 @@ battery: battery {
>  };
>  
>  &display_panel {
> -	status = "okay";
> +	compatible = "samsung,sofef00-ams628nw01", "samsung,sofef00";

This breaks the ABI. Please describe, why it is sensible. Other patches
should describe whether the old DTs will continue to work or not.

>  
> -	compatible = "samsung,sofef00";
> +	status = "okay";
>  };
>  
>  &bq27441_fg {
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry
