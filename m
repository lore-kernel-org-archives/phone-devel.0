Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2392625F7A7
	for <phone-devel@vger.kernel.org>; Fri,  3 Oct 2025 21:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759527311; cv=none; b=BD+aYLzeBds58fD5oQdqvbcviP37aMh+RLc9PkQjoTBU65Frhidk64RBBeiKdFv0+JTpqF7WebKzRvqoD8vmoh2S4XMaK5UOsD6uTAPdLK5FuY02p9pw1nDS5xLnZF7C+QOLHJF2xqMXUjtGARHxFCG92pXmSniTLNOZIpIXXaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759527311; c=relaxed/simple;
	bh=DnrF73u6uMcE7A0hMfqbDRM6WB4hE4mM5ce2ULK284s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDI6bD6l+eWI0uBHqlmMs0eTl6m5XYRF5xLWXw3/bCj/DxlWCh7Lz8OzcMabts8vcibKyJiTYrZOFjXA7RzDA+gWqvPTjp+bppdIhFyH0esRlZRQ8HUdveVpaoDkJyTVWR0HGTaeL+1IP8LIybTntUy7m9B3hooTXOzmY6SwfjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZrHut1k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZrHut1k"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593AjGkD012709
	for <phone-devel@vger.kernel.org>; Fri, 3 Oct 2025 21:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LpI/7yRJpPkrv000URxHAeRb
	Qcf7cqEUhbfJVAFL+wI=; b=ZZrHut1kRLXUxPCNTSP2FckZ0jQQGQkQpJBrO813
	3B0FN7Uz1SxNlMBo2cvdJOujhsIlXSs9D6xTusN275IoAV3FdE/GhNcl0QPoMrhE
	ADR2NicnCOBBnv0w629S75dger0Z8aNyUoZBZxEEr+Bx92oZ9hseSBvNE3Lz66hx
	0DGrgEjaljUqebpriYAcN08kftzfHkDp27fXYODp0emOPs5P8+PgvpPeHGqmuN+M
	s86/5PQQcx1apuQOkfcWy9qmzQ1gwdFP+LqS20o27jIGTg6py4PnrT5aDhegNKZv
	mD0STJqX2gdjb12+H53dHhmgyI0vINh1oswYyMJL2f2rmQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80u46db-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 03 Oct 2025 21:35:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4bf1e8c996eso61978041cf.1
        for <phone-devel@vger.kernel.org>; Fri, 03 Oct 2025 14:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759527306; x=1760132106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LpI/7yRJpPkrv000URxHAeRbQcf7cqEUhbfJVAFL+wI=;
        b=p6rq7qZz5U6bxPagQCp2E9Ib3CzDMahuavktG1UzkfJo/+20IDOCdht3q4xXPnjrXp
         U8GxABg5pG73Zbi1T9z/+HiNdOExFhHmFsS8Iqxc5bl7h+OelCpx5ZsSQXRlX9TMEkOf
         K0CZbxa9aucFuJIZN06t1TTwvMFK9u5D3u9icYVGz7mNs/KfGO6vYxMsFIUi2mzcUjSL
         mXyej+RZLXB88gL8KNEYwBYF36SqwvJBo6rPEDES88+6r4ncZMEWPQjd3eVBxKH3jYrw
         17sIsw8o+s6Sv3rOOujkG9UvxdGtYoGtcmOvlRST6DqKbjrTcyjEVVEcAu7iouF2JH1C
         zz1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVur+mmamO2Pis8ZQQlQuLS4jt8OmUmn01wJHWrudKQRUas4/cTCiiRZ8+xh+F6vKoqXRsNvq1CRlgNkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4tPE225HHi/5F5Lkko3HA1SnN6xOpBe1MMRW5VsPI0AbgSWoj
	+uyrpbkat2+FeYDrhXJys/48c9jmcGjI6MuuBaSAQBNMCdfz5GmF9oQo09zKx8W0Hl8tQmBa7UI
	kjwUZu+d9qLKSf7HKXle5/7H8J515A2Gmd5R8TOP0ziK0g6GX5di/AfYeOUmMuDoUvA==
X-Gm-Gg: ASbGncuE/l19f3vP7UhCwSz3ElwZrmxLeITV0T9qp1O5qjYpmEp43gmLRCqI7oAjXe4
	+Qtp6TaB67TFfQKS9Bz7S0iqe35qahmDUrR1CS5QiIyLBUNfYivzFe4rcqHDugb6i2z4npwkAWc
	B/XVXwZfQ7AW+iT7Z14k2qWBXJw+txgSfDpKySU/bGxe2M6jTtsIvxji31yZ3zqdRGTr6dIh5QH
	APXLcarVInWExD0NY7CQtjMFhZ7Wzeizi6xyjQV/bQYhoHie6XqmWJs20HNzaxPVN5xGfYCgPFg
	88OQYCXXCxcCVIiQFfTKOSiMsjUkBVujIXxGC8F7JfK1B6O+39kuP1HILdBcVWghlZdh6KzgBei
	QUMtHCHsqGDft0/oW7ASSDMQ4jvbb08MtmOJhKE+31GjTtQD+l4ojtTH7Ng==
X-Received: by 2002:a05:622a:590a:b0:4b7:983b:b70c with SMTP id d75a77b69052e-4e576b1514emr67212631cf.67.1759527306040;
        Fri, 03 Oct 2025 14:35:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOVVXTCFK0bJqYHUQeg2fOzIn1NMy0zPMk/luomgQCk++Xf/E/5Va5+hVQu2xGh6/6fUAjEg==
X-Received: by 2002:a05:622a:590a:b0:4b7:983b:b70c with SMTP id d75a77b69052e-4e576b1514emr67212161cf.67.1759527305386;
        Fri, 03 Oct 2025 14:35:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0113ed8dsm2191806e87.44.2025.10.03.14.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 14:35:03 -0700 (PDT)
Date: Sat, 4 Oct 2025 00:35:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v3 02/11] arm64: dts: qcom: sdm845-lg-common: Add uarts
 and Bluetooth
Message-ID: <6zfmjxpnruh3njx5ts2f7h6zsegvks52izchzj2jaciprdvnly@nnyvivpmehkh>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-2-b14cf9e9a928@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928-judyln-dts-v3-2-b14cf9e9a928@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX4YNXWETYJZgv
 2BIDFfHqg94lVm/C0KvNNd+G/CYO96lV71BqxWWzDp2cMC0Fc2JnL2cdjGe2qhibGez2IYCL+rr
 +DDH4jyQ4rTMkl/c24NWI9h+XDcD6sWXlAZxz66Vko1tFfhf4aAjrh+Z1ae/WsV6zk4zVsfi5Er
 7AZ1vV5crihhj0mii/USVA9naH6issW54GifSEiuq4J6fbbmAz9y65ht/CgDJHv4+9L+TwgnKZp
 i5vRTfjl4miur+RfVVZMMD4qwQ7JASSu3fLr+xocINfZFpj0XTaEWtCUY3BF63u0f8kGrZUlCrh
 2c4fpFM3QVmKVJuI9NyvvgrrewGnb58XDkT3T/2gsFmVqS3psIJRlzjfojSFs3zTBt+lvGjuHbD
 3tjlg4Brr9m06ogRQ34ghYYmK/mSmQ==
X-Proofpoint-GUID: Uq0mtnnv_iAWLQOKYgYT2UE_fogFt7V5
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68e0418a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=Mq719mGqAAAA:8 a=Gbw9aFdXAAAA:8 a=CXzs4G_5OfBr_OUmaxkA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=gOTWM5O2Sh7P_NUuVqe5:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: Uq0mtnnv_iAWLQOKYgYT2UE_fogFt7V5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029

On Sun, Sep 28, 2025 at 10:05:25PM -0700, Paul Sajna wrote:
> uart9 is debug serial on USB SBU1/2
> 
> UART RX is SBU1 and UART TX is SBU2 of the USB-C port).
> 1.8V Logic Level
> Tested using pololu usb07a https://www.pololu.com/product/2585
> and CH340 USB-UART
> 
> uart6 is bluetooth
> 
> Add bluetooth firmware path
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 45 ++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  |  8 +++++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 82d6543835324ed92300c4ed24c51f4b79321f99..4c631df56f262ba9e730f6720abd94d374b14692 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -27,10 +27,17 @@
>  /delete-node/ &wlan_msa_mem;
>  
>  / {
> +	aliases {
> +		serial0 = &uart9;
> +		serial1 = &uart6;
> +	};
> +
>  	chosen {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
>  		ranges;
> +
> +		stdout-path = "serial0:115200n8";
>  	};
>  
>  	reserved-memory {
> @@ -595,3 +602,41 @@ &usb_1_qmpphy {
>  
>  	status = "okay";
>  };
> +
> +&qupv3_id_0 {

Hmm, I r-b'd the patch, but I was too quick. Please keep the nodes
sorted. qupv3 comes before usb (and maybe before some other nodes).

> +	status = "okay";
> +};
> +
-- 
With best wishes
Dmitry
