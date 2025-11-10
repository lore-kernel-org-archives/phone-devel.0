Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BAB26FD86
	for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 15:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762790316; cv=none; b=slV/9MXzD4J+NzIvdrGji4C+M7lqFe2LBvWlhsjoRrpHcZAL6HyxApbBvNOVSvVpg+/Gp7/7hlV7Tzp5khugW8q8OyGCNDMQc0RaozGS8RLyGOTia+/7+Lu6+Ts8YziJGJ3uYIgUXEvcfQtOUmEH8jLMlsib92YCN/Xo9Skc8W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762790316; c=relaxed/simple;
	bh=tPy5FwvJbQCoIpidnLoxpz6S1F3GlO8FzytxOrtPRUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVKHDyPBqgSkHRiOnhhrG1/akVckBKB9EVnOzPgvcl+4MHN854mzkS2gsN8Rr1uJD+Fyxoeyb2UK7OWmBw1S8j6gENhKSz5MBhbNPkOlxjMJVd0Jv+SNi4qAIDdVfdhhWz8H/s2D5AKzL1ZG1NXl50W+RZ7qXG+QllTJSgU0Y0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFJ1lc2X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F1sIlN6v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFJ1lc2X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F1sIlN6v"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AACAmoa4029952
	for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 15:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3FpMNZu3Cz/i/gtRUzS3IU2S
	7zzqm7oC4KvJHeoPfLU=; b=BFJ1lc2XHNG+0LM5ble1t1dK52FEyS9F0XI9O4tu
	wioUk95WQClFCtoj0YlfuU0yzQK8zfNSKxdoBPG2zNhOr/ch4MGk10wrf+ilpULB
	rnplI5O6FAa4Evd2CvRTC/vD4llnPG8an++R9MbDS8CcT7sY2StxUFMqbl52s0Px
	jjoF13eZpiZdJArh9CnMWTbj+jFH6IAboiHsUhmK07gi6pm3c6mNdFol6WVpei34
	Hugq3F5e7ZKF8fSv0aih8ZufAbsfK4jZJZ3Y5ZjG1iMO6GMiqyVoTjbgx7Wbc+KK
	h0nUxxM3aEF3Gutf5muXrHvJ+XLAMfaDcHk2aGIoPcm4hg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xvjdb6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 15:58:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed5f5a2948so89998071cf.2
        for <phone-devel@vger.kernel.org>; Mon, 10 Nov 2025 07:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762790313; x=1763395113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3FpMNZu3Cz/i/gtRUzS3IU2S7zzqm7oC4KvJHeoPfLU=;
        b=F1sIlN6vyugscdp0nrjz4scbLFUcyT+o8dDGC5dIxzQ/Q1gIVlMYW6Gc50B8MoudQV
         3Trv+0RUslKQyiYdXdQ0wVIro8Y+QTJJQaYMSn1XoumiZCp9pusJorRmfP8AldXQ8nA2
         DFAjWOOzJgba/vVrb74nyEG6C0JDZ0MIrYlE4z+l8NeylyptmJZ/alyIB3oNy+92iLvA
         tl7jQPjp8jziSL26GcF1axW7nmwzcNV6FbRPUrdNb8TvaPwVRdWO5xl8rlfmCnT5rUAL
         76szv5cLVASp4o3L0UkXLP4uNTwD+HDe4HIOGbTqQgkQSqB39taJug1lwPEnIG5JULwN
         wf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762790313; x=1763395113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FpMNZu3Cz/i/gtRUzS3IU2S7zzqm7oC4KvJHeoPfLU=;
        b=oT2g1cieqIosEnjAS0Lne+yVujCf13ZhVo948s0ZsHVCAOuocD9cMwkB+BrjpsizMD
         1/FmGowvVRSeftpJD9AcHFCbReX1gIGaNQYWcbGZmBiCjy7cxlHALYUcor/RsMEF1MBc
         vRgnEdtPh9YI9pRtUfqSaoTFg4vYP2Z5doX2DaUNbjz+lbe8A4YvkgqMC8pPAMJppuQ1
         uoxlgaZTkcxz8tXvQxYRmDO7Pa61ZVa8OJnpPQjnMyt2zQOKqfHV8/UWoQitj1HA7UqD
         zqoBkNFmpfsnc3NBMPfx4z9lYtAHbD1zOfoehJSrXG4yzpGjVRsHDaqDE28KdWS9Q3wp
         KLmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWflwwOKuafS0EttgLQkoREBHobpNpsI7Bx3QwGbILU2vD8EepyAsmieBdVb56Kq3pkKFpOPKRChbDwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp5eNKEJhTBJefDdugGFGaBBjEi7EZyOZ/wApDf6d7oAqAwuat
	yCSzxyYKU7tBQt59gsRBfWj9M9TnkUVZuBDR+HhAa89XNXEMwXyhII0HxkxLqPpMjTwvBbJ0ij5
	I4VTrKbQdg8sfh1NqaPwwvQj8YYKTcfMAbHmqIToXw+NRswGEjtSWle6nDlnOX+7jLg==
X-Gm-Gg: ASbGncvpqZsoRbcJeikc/JocVRFqVc/CG7g0dU/5yUBFlgyiXTLmCZWO1DPkZaKNXFL
	ZzbdKZGFQ8IIEfuT4IUc1imIpMS19iJd+VbI86eUhkrvZY0old2nSUHmEnt9eWtERvXzJn1a9Yg
	P0+x40L4Q7WovzozC36JMyNQUU4gh7cC/WP8/+vQfIdStAhkAtEBWW6W3J5erhFK/6/ScelDpq6
	GgQp2mv7Rij3CRDz0hSXiGdQD5jiNmhC+JcwyuAN7igupeRO6d56VxqTDHMHokj3dMbj+S3vTV3
	SCEScQiJZHu6YfJborXvbtYAOM6JvwTQq1Lv+fpeaLZjUeasgXh/gh7tnnEGHDOzx1BOlXQ3G0C
	gWrcpI2o89iRwl2rnqQtbUttu4u0cZ7k6aiyEC/pC5ItI7CNKx107Ox9sphIPh/OHE2k+VUmNpp
	2blIPesuJx72Qw
X-Received: by 2002:a05:622a:2c3:b0:4ed:b75d:31e0 with SMTP id d75a77b69052e-4edb75d360bmr59124831cf.6.1762790313399;
        Mon, 10 Nov 2025 07:58:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdPbMW+KH/OaINk3tcMozx8h+ra/8Uj6lYcYx5kCxoxFDoZTefGVQa7IEjxe/FgWViePPf/w==
X-Received: by 2002:a05:622a:2c3:b0:4ed:b75d:31e0 with SMTP id d75a77b69052e-4edb75d360bmr59124641cf.6.1762790312957;
        Mon, 10 Nov 2025 07:58:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a5f0ee99csm38202821fa.45.2025.11.10.07.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 07:58:32 -0800 (PST)
Date: Mon, 10 Nov 2025 17:58:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Dylan Van Assche <me@dylanvanassche.be>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sdm845-oneplus: add ath10k
 calibration variant
Message-ID: <wqjil4hhrbsozvhwdf355dqpwu736z4x2nwnurug2bpx23ed3g@c4shkwfyohky>
References: <20251110-sdm845-calibration-variants-v1-0-2c536ada77c2@ixit.cz>
 <20251110-sdm845-calibration-variants-v1-1-2c536ada77c2@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110-sdm845-calibration-variants-v1-1-2c536ada77c2@ixit.cz>
X-Authority-Analysis: v=2.4 cv=QuxTHFyd c=1 sm=1 tr=0 ts=69120baa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ahC5f1j6PEOMoUp-Vd4A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: yTo50PAC-dr9BZlWxyBQvXHsReLdg6Tz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEzNSBTYWx0ZWRfX0aKRQCI0eRCl
 8cbqLnAx4P7Bbf/rEqoUpB4jpO06KlfU4GRgXC1+BWqzs1o8OIJFfUS/C2Hcfx2Tsqf+Os6pzgG
 C8RWb0RntPNZhk3YrixLqxbt6u5zlvEPLy7CyEGz4S6HcKKNryzGbjE941ZlA5Kj6eQcdq/g3wA
 02PPA7BF1aK7P73ug0/2oyCauoNjS3uUR98LEG+k+PEBn4IG85siyrgCSDXoH+lh5JhMYLhAynX
 /OvA55Z/vSXNSljqftHCnYqFoQfbAzIYgjP+nDqD4qZzCliOuII714sGWkAhuHLxtKPH9wD186x
 cIvoNEOoK5mJdxM90imoXErAzdH0Iqhr9/y7tGLewGy9Vp7s/dcW3ltXrTqvE7cT0aL6C7Ksn6W
 tqhg628mZkEsnJ6QAbv64pitDtU+iw==
X-Proofpoint-GUID: yTo50PAC-dr9BZlWxyBQvXHsReLdg6Tz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100135

On Mon, Nov 10, 2025 at 04:37:46PM +0100, David Heidelberg via B4 Relay wrote:
> From: Dylan Van Assche <me@dylanvanassche.be>
> 
> SDM845-based Oneplus 6 and 6T have their own calibration files
> for the WCN3990 WiFi/Bluetooth radio with the ath10k driver.
> Add the calibration variant name to the DTS to reflect this to
> allow using the calibration files from linux-firmware.
> 
> [David] Adjust the compatible as ath10k-calibration-variant is deprecated
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index db6dd04c51bb5..a0c2f6efec59d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -929,5 +929,6 @@ &wifi {
>  	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
>  	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
>  
> +	qcom,calibration-variant = "oneplus_sdm845";

oneplus_sdm845_6? or oneplus_6_6t? SDM845 is too broad.

BTW: Were those board files sent to the ath10k ML for inclusion?

>  	qcom,snoc-host-cap-8bit-quirk;
>  };
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry
