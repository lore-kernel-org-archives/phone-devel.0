Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EA526ED3E
	for <phone-devel@vger.kernel.org>; Tue,  9 Dec 2025 22:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765320164; cv=none; b=jFAVp0o/zLw7Icyn8tx4djHle5pMn6OvWmhILkkH/QRj8Mlq/EHLtIz5mR5rnBQQm7A6X/4cWxLol5VvRfrqVEq/UeYhSW1AaP5K9ElkRkau3WWx0zfofS1SESd3xvPd+CHxJqYmaFD/PeGSinlIYPtplICSXLEkrcKXO4peFIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765320164; c=relaxed/simple;
	bh=L2apk62jBA8N4mYMxQCPIOA1jy/aRThI0KvKNDAUuFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FKXAsd2aJ1fvu51qDZnWAmf6HLjMoHNTJy95jTX4MhjS//N9H+rUyYQXTGGgmopsfm2K2W+a8/XLcWUANYvNwQwdbO2oL1w6YWb07JIhifj3/BQEb7CkxD0m3QnMKGk1YY0u0ZQB1JT//rf/aeQdMVUoLrHVojVqKb8W1qvRTL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hbODv0BH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M+Y9mNYR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hbODv0BH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M+Y9mNYR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9H3n67802457
	for <phone-devel@vger.kernel.org>; Tue, 9 Dec 2025 22:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3HJPJw8BnHwUDLYnlVfUA49W
	h43bJ9QOWXO5EKr1pEg=; b=hbODv0BHMkuKkrp767sq30bw1Gn5U7d1at4PVvCs
	YasKvHx+I7njVEZMV2MwANgOwWbWW7FX3wEAIeoT+33w8BKp6r1VCwEeuRupYHfC
	W9grVu/iZlbTcGOeGfO0+OqJ1uCVGK25q55e4KF4N1JpS6IiaOtyEo+MLEQb+l4v
	rGWFGIvtCgvfnPXF6Q5VLTqK9M4RVKF74Xrebmzs94kXHJ4ZGZUMwZyjBnr3nNcu
	oGESH1vn81Nx3Pmb2lC4fx5oXCtzBHp0z7mBPNiI6G9FJDgsTYuMdGHtcHp7Zv/l
	1nonYPz3bacffCtKv/Oy79WJ+x0AsJkP9+C5w+eleBYo2Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axqu58w8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 09 Dec 2025 22:42:41 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5e5632c20easo670959137.2
        for <phone-devel@vger.kernel.org>; Tue, 09 Dec 2025 14:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765320161; x=1765924961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3HJPJw8BnHwUDLYnlVfUA49Wh43bJ9QOWXO5EKr1pEg=;
        b=M+Y9mNYRHNPIkrgGLP+ljH4akvqT+F7f6bOy6tFae1WE0lz5sQ9gFGwTqsXlCYU8uk
         jvxyaA2ZlnuQxJ1gnsN5K7FVGBQIJBRXpXmCLq+IwWDASu34c2VOvfgEk3lBOYTE6H0Q
         0epBgQ2u+Z3eXnUifmJFz89MspTNutI08Qa5Z1AxFLrm4l7jUrrqtHcywKYIA8Y61FnB
         FGIzUXdW2mleBB2lFmGvN0lBuw00iPdJsmLdKrFY3Rm5jhjk6aEPGC6rHBL15c7k2FoX
         2XZ5krEaZnkvEE93Zwy0CTwgczhDNl8CqP9cs1+OWaRK/kwMQGDyUP0qb+c8cBaqlkUz
         nv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765320161; x=1765924961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HJPJw8BnHwUDLYnlVfUA49Wh43bJ9QOWXO5EKr1pEg=;
        b=OYVSJoFM+zvJbR27V9ZF4c5OFK23oqXfjZGvEKmlgyOtpZ7XGHRiuu6FeQUudvopvd
         5hsRFGFQPCurSgS8sNYDM3qwfETwEfVbm8oCwLBK9O3XQyCAFw3Ddn9xwhpcwRnQ+zcK
         8WfUvjtan0BGT1CRoNDo/qdBHTk7s6cmYjZX8u8qROrk03H2HXrv8PjiwJedKy2dW17E
         4tOase/9S15FNalAla7fzogvuG8GDcgcVFAXxMrbeWmwVfRxQSWK3Fmr2QFIk2W5RVSh
         2NrLmiCx3cXxTZR1tAOX2aEs14mtjok4p2E7P/tRfqTKaVWsOCVIxxTWp73fnJgv8T+e
         lhjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPqbxl73D2Ui7TkO7B5d0GfsJsO+/dFn4B0qUYNTR/ON1MghymNV0hmqkvgAqAbk1drlPNcP2sFQAZlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFBADJZHecPwYnQPMXVb7szv2W/33q7aIprBL0WTYawuvmQtk2
	AidkSCGcPVFBniuHuA1VRzxDK2lJAZNIjfl5L7iOkN7FOjPgd/wa5QwyJh1JkL2VEd0Gb1ZGNR+
	J5ThyPZgShzIbeKp/F7SZkBbgS4zbks39QI52JGUhysX11W0FyQ49kcPNwnOkWCjgyQ==
X-Gm-Gg: ASbGncv94smqbqH9W5XeX2DP2O/rRdkyXp+ol3Fc8w3/hmsWqKM7Jx+LluFLKpW7cac
	iAPiopn1MyjaqGwDkS8Jz+XEFAUJUlK954rhWSbATzR/lc1nc7mO+xc2w/SBKGtZy/0iHNUQd3d
	bwh1UqiMC8IWe20vDM1R+JTYcgEKxzkhBfYbeelr/BXrtzNxb4u+Hd/xu70WN7fyf3yTBL3X+a5
	t+Q2axKclkQKK1mH6+MH//sTkNE6Ho941nhwsBvEmQTvHvts17GIGbZmKNN6QOF7LZagFBMXsVY
	6y0wZYCPjr+8EAbQKTM3scveCZOjE5zx0tND2t3kJ/P/xfmhyfHw/l2xv+HrQ/92ofsocFnCmOa
	uqmkjGiiN5Le4nLu5/zsEXfX0g/7Phh6FBwsvutP+0NJdet3puHg8nju9oCWMAh4mlogzbKjy59
	Fm57YGRsSJOQI3C6C6g9QcrlM=
X-Received: by 2002:a05:6102:548b:b0:5e5:63e3:ebb9 with SMTP id ada2fe7eead31-5e571f1cc97mr140210137.40.1765320160695;
        Tue, 09 Dec 2025 14:42:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG29A2AD+KXPtA0IIwiku2hfP40ZWsH21yDI12RRxWKtn8K06eKpoAWm4hl2mHpkBLV34qYPg==
X-Received: by 2002:a05:6102:548b:b0:5e5:63e3:ebb9 with SMTP id ada2fe7eead31-5e571f1cc97mr140193137.40.1765320160271;
        Tue, 09 Dec 2025 14:42:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e70595ff7sm50933701fa.30.2025.12.09.14.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 14:42:38 -0800 (PST)
Date: Wed, 10 Dec 2025 00:42:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Petr Hodina <phodina@protonmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Amit Pundir <amit.pundir@linaro.org>,
        Casey Connolly <casey@connolly.tech>,
        Joel Selvaraj <foss@joelselvaraj.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 8/8] arm64: dts: qcom: Add support for Pixel 3 and
 Pixel 3 XL
Message-ID: <2eg7ef244ykfb73c3ztd4z6tqu647j5h3qaobdjxsxywdqtnun@lea2erzgtgka>
References: <20251208-pixel-3-v6-0-e9e559d6f412@ixit.cz>
 <20251208-pixel-3-v6-8-e9e559d6f412@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208-pixel-3-v6-8-e9e559d6f412@ixit.cz>
X-Proofpoint-GUID: qnD2lWfOtOj23QpYIZI_Tekv1BUUOTZD
X-Authority-Analysis: v=2.4 cv=Y7/1cxeN c=1 sm=1 tr=0 ts=6938a5e1 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=WFa1dZBpAAAA:8 a=EUspDBNiAAAA:8
 a=vNBBnn9n697nUSg-uQcA:9 a=CjuIK1q_8ugA:10 a=dK5gKXOJidcA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22 a=MZguhEFr_PtxzKXayD1K:22
X-Proofpoint-ORIG-GUID: qnD2lWfOtOj23QpYIZI_Tekv1BUUOTZD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE3NyBTYWx0ZWRfX3A47eOCj2PFC
 QEuqee0LQmnR2doFCJnqlY7hF6Uhhlg68+TMa6AtIt1u6N6Jb4PT38xKnej3iPU4mmC8r6YDy1h
 Ioja17a9Z+ncU+Yf3rXmYCLaL6wPbCaApRygYc88x14xwTcGs3lLlzo4omeGvODMPShwYLfI6GC
 0dtsHqMuRVK28juwPMM6ABkZYGaK0apYYD0MZn+O4szKaF+r1qJi0fyowNB0F+p1w3aDTu31HVQ
 NGpntGIKcJTu1UDRe6MQK8kY2rgZMBoL+7wD87HdiUYfTp0Vm5sCP/PXARJ2yVeYg6IG4chmpRM
 ovhEkBGKgDySJvS1DTCJ0V8qEQ/QEI6swAYzJrNlAK0ARzA1fCQgLQgvrVsPW4CxD3JBo+bCkEf
 zQCW9H4a9d3o/DUJ05hgvo4usFSjXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090177

On Mon, Dec 08, 2025 at 10:42:01AM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> This adds initial device tree support for the following phones:
> 
>  - Google Pixel 3 (blueline)
>  - Google Pixel 3 XL (crosshatch)
> 
> Both phone boards use the same identifiers and differ only slightly
> in their connected peripherals.
> 
> Supported functionality includes:
>  - Debug UART
>  - UFS
>  - USB-C (peripheral mode)
>  - Framebuffer (both u-boot and Linux)
>  - Display (Pixel 3 only, and the driver needs work)
>  - GPU
>  - Bluetooth
>  - Wi-Fi
> 
> The rmtfs region is allocated using UIO, making it technically "dynamic."
> 
> Its address and size can be read from sysfs:
> 
> $ cat /sys/class/uio/uio0/name
> /sys/class/uio/uio0/maps/map0/addr
> 0x00000000f2701000
> 
> $ cat /sys/class/uio/uio0/maps/map0/size
> 0x0000000000200000
> 
> Like the OnePlus 6, the Pixel 3 requires 1 kB of reserved memory on either
> side of the rmtfs region to work around an XPU bug that would otherwise
> cause erroneous violations when accessing the rmtfs_mem region.
> 
> Co-developed-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> Co-developed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Co-developed-by: Casey Connolly <casey@connolly.tech>
> Signed-off-by: Casey Connolly <casey@connolly.tech>
> Co-developed-by: Joel Selvaraj <foss@joelselvaraj.com>
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> Co-developed-by: Sumit Semwal <sumit.semwal@linaro.org>
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> Co-developed-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   2 +
>  .../arm64/boot/dts/qcom/sdm845-google-blueline.dts |  85 ++++
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 524 +++++++++++++++++++++
>  .../boot/dts/qcom/sdm845-google-crosshatch.dts     |  33 ++
>  4 files changed, 644 insertions(+)
> 
> +
> +&wifi {
> +	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
> +	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
> +	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
> +	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
> +
> +	qcom,snoc-host-cap-8bit-quirk;
> +
> +	status = "okay";
> +};

Missing calbiration data. It needs to be declared here and submitted to
ath10k ML: https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boardfiles.html


-- 
With best wishes
Dmitry
