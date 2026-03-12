Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6D63806CA
	for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 02:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773283621; cv=none; b=kYcHyG70rLc1e34+eej+vQ5e7/PAMrOwB6ujdaI+k8Q7L7TVvCrjHzmP9SeawG/S9QBkaoUZiAavTCEce1jihPe7YKzonEBi0UJXRghGTqfQnK9uv8QDg6if2Syim4uR1oztesfE7Ycutah6xF8H+RZSXyvY6JKaV9bxG5TPK38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773283621; c=relaxed/simple;
	bh=muhjVxcsZV23G2vsaXhM6ZfnTnudhdZxEpKIvh3D5PI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6Kehxu/KuxzeiKNeLPRk0agWlBHObxNEXmsQGl38b2amtr45VF6Yuia+2J857zVy6O7jHc14vemQV1YMWFZ4tKMU9klaXOUslwWrj/Eji2C8kZUJsReiVF+s65Dn1jWt8sZcwNFlDvc+0MnhEvaNh5lx1CI5rGvkryxjyL7NRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=os3qShQP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IsDht023; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="os3qShQP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IsDht023"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMMnBA3136568
	for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 02:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c38zHwY0Losz+olyA3EAKAi0
	1k5oxItl4o3Z8kp0dZw=; b=os3qShQP1fk8+q5l21OGuBy8zpzr7XwarVtnQuc4
	DhBmLJuDttWTBNRRGiHsndalylUiAsEY/qUQU+Z2c/7QBWZQycwKA9LvDAwS1+tg
	bcQ7YaPzGNLTrz98a3gCQ4SG97Hy4ybRGZLosIJ0up7HkAcHdOXNbQzWgp0DGIeL
	6PZ6VMe5pU6zfu2fopBFj71Fjrgeby6MVILaPipb40RFs1qWzsQ0YUvBxzk1rsNt
	Itl6dYbazBbSQeWmwP81KhKtaSkRZK52txgH1aK1+aUnLCJUL8LnNMshjAhoq2p+
	l6o0Vsxo+V6w+TE8/2MDoN+IuLqtgYTVX3K//O0m1dh8qQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w8me8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 02:46:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50920055f0aso42234981cf.1
        for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 19:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773283618; x=1773888418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c38zHwY0Losz+olyA3EAKAi01k5oxItl4o3Z8kp0dZw=;
        b=IsDht023mHjWhdrqO7z7JdLQ+pcDOguN8ojVXHJfAud6Y5R+q7SYTvm3RFrfaTbuFc
         4SeE3AUaQLwV91yLvSx9l5oLfd0LmZtfGUAOCa1Rd08oRrsXAWpaMLTFwFgZmmi06Hsg
         eCM2oVpamzcpCEHWNexoZaO6s2Pkw8kY4Tul66T6v3halSfNC64Bo5fJEJmUJvfWN3gD
         STYqCQP3wMNsw2JJwH35LJlEF4iWxNGKyyQZ3VsnbTqYcol79xOxLnfwjt/scxt0cy7Y
         Ti5G+YZQUEaPUpQCPgZTDUgpdOkix3vQJogC/NgGiG1xpb3TqAHyfH7QF1TXrQTkmbuP
         eM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773283618; x=1773888418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c38zHwY0Losz+olyA3EAKAi01k5oxItl4o3Z8kp0dZw=;
        b=J0cChPxUjv4GYALfndRo8FK1csFrbXxS4uIH/ayrLsf7gXSiI/J/UJeJpMGZiK6TRi
         EJ7Jws3EdTpwvXa3mov8EII+kvjn+RCoTL/jP05oXj3Mgn+IthxBtFOc9kfWGVewm8tE
         PLSIEQkejZ/T+vZf3+Vy58rkJ5g1+4hkxI3lqD7dzPgiwu24/5FgqY7TVB6vudtq+Mmc
         3m/OjUxMGFr1Ks5rWYISXti1/gUioxb5plz0kep6qdTT8T2NtFr/1l82k6Ig7/wOJGrk
         iNDQ98+zdMdTbDKwB6XIOCfhexXVPdMM6yBjuGJ2z/q/ZjzyB4mOsvuWh98PQt3R5blJ
         /TpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJEuOaxWWloleAtDgnpyJb5vhPERLq1DbzRMLd+Vjh15tanH4t701qQMhm/XZFrbVqBNqrI1jBzZJziQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/L86U91wxvYGoxCD53f482hI8JboB9LjHNCeIRTDBsVe5x//9
	lwYsVX3aU7NF+IWpEXwEchbbWC3U4gCG0zg1MrVDUw6EVM5hebnwMEcHnP1e1Y74RF0UXeUyd6A
	eQPU1Lg6qRG/WjfRpQoY1VofzZbwoO2I/lDAXOQyPE/F3xOQfSWhET8Cfiqw/11HF9w==
X-Gm-Gg: ATEYQzzK0Mv/W9FLVaq9S3GevIcpBRaaLjuOZqscGcaqOFu1gAKykGN9JCc4D+JJqb9
	cVMAab60y8Sdu+C+ZsnDQIGRspyKQ5F6JfwiQhxMVDGsfFsqQq7DEfjvsclEDcJkO380elmzYJA
	X6Ng8pCbvwR3XI+JFIHnl6bkIPdnbZXsBCmu90ugBrxNTbOOxwdtHKK1kVDEybExYYl63FjvpCT
	lmwCbcfyi7FO/IyBGHWF16CbzUaybka2T8KHSVH2rRRLKQE3TbGXANwfkZAnTvCCmCvr9Rm0YXh
	69S+BJrQRIvHiiqlYq12JS8sk7Tzww01qpL1shfyjB9ZWmsJVMIjW3T6vh+a73Z90BtYFSHEICv
	lfnbmpWCfywzZlFs8Lz3mpU9J93xIDs+FErCYXZlA+sCNuWQ5bQYx6mPp3hrTdrCDb7vxPKiFCH
	mY64uX7LByd//4jqgLpU4uX4KO7ijcsleMjIA=
X-Received: by 2002:ac8:7d94:0:b0:509:2382:8881 with SMTP id d75a77b69052e-5093a171accmr66141351cf.46.1773283618104;
        Wed, 11 Mar 2026 19:46:58 -0700 (PDT)
X-Received: by 2002:ac8:7d94:0:b0:509:2382:8881 with SMTP id d75a77b69052e-5093a171accmr66141071cf.46.1773283617578;
        Wed, 11 Mar 2026 19:46:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15636eb3bsm685835e87.83.2026.03.11.19.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 19:46:55 -0700 (PDT)
Date: Thu, 12 Mar 2026 04:46:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, Petr Hodina <petr.hodina@protonmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma:
 Disable MDSS
Message-ID: <t4uhjpxdvjxda4dxkoxktv6xlxg3xvzyslgerluu3t2dzxv33v@k46gvwv4uf22>
References: <20260311-beryllium-fb-v1-0-408a580d125e@ixit.cz>
 <20260311-beryllium-fb-v1-2-408a580d125e@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-beryllium-fb-v1-2-408a580d125e@ixit.cz>
X-Proofpoint-ORIG-GUID: KhXTie3UmEkNbTfXkNMx3J0xnzzanyJ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAyMCBTYWx0ZWRfXxEux1gQdGMLz
 M39svXoZID8Mq6hrYDqNCEkb+KcKZpwPkmxmBrn9T/GSo4NZlTBOiK/vOeWm7WPmtyUOae3LP0O
 VlV9weGlJvWgo43nxd2fE8w9k1uq7Puia0xvFebxlPQhSaYXWkrCHzcXnJDwY/Yf6OR6L+6XG20
 FyRHVetAm9L9M/NucEnm32h+fHkD8ApGRhab/MOWAlPrLDgy5k701RIeN3xFEoyPS7tcpXZ0ccr
 Xr4Z3a7JLTakBtYZXqfHkJ0AKgLspcmZsGqsMOMENMsBooWlxq+PrW7XJgWHlqjq+FfN6VPCEcO
 WjZzzDrScwLocxqr2mdoP1Kr9K8SuGomjQ3tFQD7z7B8aD13js2OCNfSQuzIepVNYdmq5UHrMii
 gRIPzhJ6giQY7FjkpDLfjkhYwpbOud6qZB8wOdr98Xbdp6WnQSZE/iugXRDO85KgbshOnroCFCH
 AaS942QPJ7uNR4JrwgQ==
X-Authority-Analysis: v=2.4 cv=YucChoYX c=1 sm=1 tr=0 ts=69b22923 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=sfOm8-O8AAAA:8
 a=UflblNn4a4D0er6g2GkA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: KhXTie3UmEkNbTfXkNMx3J0xnzzanyJ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120020

On Wed, Mar 11, 2026 at 07:44:30PM +0100, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Currently the panel driver for tianma is broken.

How broken? Can it be fixed instead?

> Disable MDSS to prevent DRM taking over the framebuffer.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
> index b58964cde8342..d1c7bccaab500 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
> @@ -36,3 +36,13 @@ touchscreen@1 {
>  		touchscreen-size-y = <2246>;
>  	};
>  };
> +
> +&dispcc {
> +	/* Disable for now so simple-framebuffer continues working */
> +	status = "disabled";
> +};
> +
> +&mdss {
> +	/* Disable for now so simple-framebuffer continues working */
> +	status = "disabled";
> +};
> 
> -- 
> 2.53.0
> 
> 

-- 
With best wishes
Dmitry
