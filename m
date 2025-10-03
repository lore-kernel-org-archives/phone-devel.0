Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C28264F8A
	for <phone-devel@vger.kernel.org>; Fri,  3 Oct 2025 21:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759528165; cv=none; b=XEObq/UpeTm1kONlp5mrTTMcjPDqkwZtmLw/0Y7ckSkzuGYtzi+/UWP1PmElNrFTdrIZRWW5WEpNt+BRyFgGSRJEZ6zO9b66slQX95vlY1gs+kjUeuThUnlwMntH2eDD1M6gYa9FEp0oBkB0bEw7ajIIXrXZbCjPuWg5O60r3cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759528165; c=relaxed/simple;
	bh=A/f+DLzpbgnkUkV/C1kd0kS9KdLCf8R82uaOHH/AiWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rOnF0Q+6HwkLpn72HTkSc/+E6OwLoOaRrYAHPJ07whmWuA/AycY6A5KAxi1Xh7muTtvo1bpLuQOqMaC8Xm9OCmwaDXUg7VExlclRtJlcfmXpv6WcUpaanrUNNKXg7qfYjguUZDNKmSBWC+Cnghuz6FEgsSgmwQutyMO6Ooq2P9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FKp1wcWj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FKp1wcWj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593AQQ3I005570
	for <phone-devel@vger.kernel.org>; Fri, 3 Oct 2025 21:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XAOFnLM9b1JHUcjOkh6stGs6
	1EHxCRmkb+sraxhnzik=; b=FKp1wcWjXLhw6UaLx5luXnYedDPCxms9CStmb8li
	+FuE9LnzDpG12vj8TdkTzgLS2PkepIPY27c5jmpvaDDXYdb5sK9g24em/cRPyj7f
	maZSJ2qUhjMbrLxZjmSK11lKPF4fb4hdfpusJ2yRGDy6dWYTkzBFJrkAuJpIblb+
	3iaolSdouQ2LrQYVH/08IURZLW4XS+amHAcreGfdmols2U+hwhu2Y/znYasoCvVq
	1pq1MbxjL3xlmZwzAVgyNPhxB+cgJ6ky27m52pWx1nV13zyNb12DIzxU0DssGJFz
	X9hFnUZ+arjTSdtcHYkF2VQeoBm2YV97pQyI8Bh5wKliug==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851v2h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 03 Oct 2025 21:49:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e484dccaafso68158941cf.1
        for <phone-devel@vger.kernel.org>; Fri, 03 Oct 2025 14:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759528162; x=1760132962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAOFnLM9b1JHUcjOkh6stGs61EHxCRmkb+sraxhnzik=;
        b=iT5GrY3GE/aSiPGnT1Z5WBoaWkgdgtncnlOMyyVww/yEedxHKGl3ZNEXDjzO0jcX4b
         NZkWJlYMhQPp3NW2ogqyPRag71AO7ywQXQK+B7Usyr1noZJ3HcnJqB6wobUDgvgwQqf/
         SCw6NpPEZ5SO+Mzu8uIYrLTyPPjCj95JrGw+vCEqMXDjknVo8zxq/0NoqEzklpxblEXQ
         88DXWe24qfFJwU1D2OPX5VYqZGKXnoPHwoiZOgF5Ze2XUUPNWUJXg/lVB5ICUBmghe7x
         iLXXh6kXiuH0YAl51Q0KjA1EF1bQaLZLG6IfOjZ4VHlzJ3ufG3kzaCzXkIrauNfwy3xD
         Bi3A==
X-Forwarded-Encrypted: i=1; AJvYcCV1pg6XmTzPYR8M+UwxUrdBoawLwEWkHarmN5dUC19nC4B8uDF8JY1jSxxbiMChmh4wJypTYVAdpvtSPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOYdX9VATAW+FweKbFhAR11rzKtEFLHE9A9rPP7EcfQvDOFHJ2
	bX2sj3vme/2FDcOZUJcBxaAwWGVdTWH/ai5tYBZ5MdYMM1IDKOvAzOOHXJ3t1ehvi5FN0MwAy/4
	LLUayXwfvTJ/PjyLQaCzZvfUMIOjIKzZJ5ouQixLzSnr0McLcuqbDsnum9BX6tiNe7Q==
X-Gm-Gg: ASbGnctNW+Jt4NzA/eU5vOoRMFQRmE/UlTIlcr0QCbYzmbZlE6YnQ9Y9Ag8N05qJUQA
	1q5R46uOgEtnPLMbgCD4/ZDDu94V4SvDqZAJk5IuqbpJCRqkxyiw1V14dmN91tiLNJ1P6MgeKen
	bhN0DLL0LSLuDkFhMWM0kgWI/F7qpVIL/iylvSUOWtTNmzKYTZJ9Qu+A4CoBvP0nik0BguowpnF
	KHQr5LmvbwbubnSAu9uERBMt3TO0TbLklozCyviJ2ts3Cm84OYH89lnd+efOsHXW/+Wwuw7K7vs
	RKm5trRb/F0s01nzS4IXiovMZWCIerUmj6RDYv/amXIY3ybCfDybqNexNXK2JjanyY/zL8yce4t
	ghzqjWgvou8DRMOjf7J2krCptzctstSQzLa9uIsn+qln4TRpDaDG5d6BLMg==
X-Received: by 2002:a05:622a:40b:b0:4e5:6e0c:d214 with SMTP id d75a77b69052e-4e56e0cd7c7mr98158081cf.3.1759528162106;
        Fri, 03 Oct 2025 14:49:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2gWwma9id+UA8T3lgXIHkN0ALwpvBBmEnGVLlo43J/2+suORG9AN6jJLAOp/iHdUYPalYdA==
X-Received: by 2002:a05:622a:40b:b0:4e5:6e0c:d214 with SMTP id d75a77b69052e-4e56e0cd7c7mr98157801cf.3.1759528161574;
        Fri, 03 Oct 2025 14:49:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119ece7sm2143792e87.103.2025.10.03.14.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 14:49:19 -0700 (PDT)
Date: Sat, 4 Oct 2025 00:49:17 +0300
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
Subject: Re: [PATCH v3 06/11] arm64: dts: qcom: sdm845-lg-judyln: Add
 firmware nodes, change path
Message-ID: <5xsdio5efpcpwpqek6e7tdk5kdr2f3xogne2iyhdl5ra2aqamu@icnfajxxnlq5>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-6-b14cf9e9a928@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928-judyln-dts-v3-6-b14cf9e9a928@postmarketos.org>
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68e044e3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=Gbw9aFdXAAAA:8 a=fxdwwflXBt89RVFT8wIA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX7xZF196xic1P
 cNBcIz7Pu4ksoV29G9m9FnvyR1LbtLoWum3Z+mxn4R6rTI6OKPodkf5M4rrK6Wv5r87PUkGV5Ik
 tnl94lL24YDkrifZ62jRrH93igzZtnkx7IxQzbaVskrXx7Owf7hFIDSLy/fAQXXV0WSDOZpx3i6
 M5Y1RY7+WJEBfgPRml6KWgyvInSARRh9Jkf7ptWk9k0n4Koyp2vkROokxwN9r9hlaIADbyX+BK/
 LYfDmAwM5dJjXFtBkfi2SOOhJBRRcuMvzH1FdsWt/HzJ2L+5UTP5lQ63gAApiJSos5qb2NM1svK
 dZeyentj+RawJsta8CfmT0+7KUWYqH6HSUYH++IsZmBrviRT/ri74wYJzkCHXZA7zYxl8wc+fjf
 Q9syHCWdbyA6Wy9vVNmpRLfMSBcrIA==
X-Proofpoint-ORIG-GUID: jDbmuVtYPqey5NbLEMotPai0gkwaihGA
X-Proofpoint-GUID: jDbmuVtYPqey5NbLEMotPai0gkwaihGA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032

On Sun, Sep 28, 2025 at 10:05:29PM -0700, Paul Sajna wrote:
> Add paths for Qualcomm firmware, including:
> ipa, modem, bluetooth, venus, gpu
> 
> Enable adsp and cdsp nodes since their firmware is present
> 
> GPU and bluetooth are confirmed working, others may need more
> testing/fixes
> 
> But regardless they will need the firmware paths specified here
> and firmware added upstream before they will work, so might as well
> get started on it now.
> 
> Paths changed to qcom/sdm845/lg/judyln
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 10 ++++++++++
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 26 +++++++++++++++++---------
>  2 files changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index aa338612433f9ac3b07363b79d8a3b8e0eedd98b..0f0a3f471f48e26cc48feb1551093599fcb35d7f 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -173,6 +173,10 @@ &adsp_pas {
>  	status = "okay";
>  };
>  
> +&cdsp_pas {
> +	status = "okay";
> +};

Please move it down. Also please check the order of other nodes in the
patch.

> +
> @@ -137,9 +141,13 @@ sde_te_sleep: sde-te-sleep-state {
>  };
>  
>  &bluetooth {
> -		/*
> -		 * This path is relative to the qca/
> -		 * subdir under lib/firmware.
> -		 */
> -		firmware-name = "judyln/crnv21.bin";
> +/*
> + * This path is relative to the qca/
> + * subdir under lib/firmware.
> + */

What happened? this should be a part of the earlier patch.

> +	firmware-name = "judyln/crnv21.bin";
> +};
> +
> +&venus {
> +	firmware-name = "qcom/sdm845/lg/judyln/venus.mbn";
>  };
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
