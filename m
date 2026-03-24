Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C273C355F39
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 20:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774385856; cv=none; b=dohDzEu0hWuRhiss1+VtnnFLuZdbJa9tX+O+K3+LcCl7+QnvDyqZ71tMN0jb2JDSv3bWg1mHsBRh36KvPXD46uBfDaB0NLDT56n9LpMkLXXHtRHTmV4e1brqMLXLjMfhGOBv33Z2e2bxeMAk9kEXhHLELfyGgwEdRxD8Ct+V1bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774385856; c=relaxed/simple;
	bh=aVffKBe82Y2JDZLFV3d1zJCx0BR6sZKq3+fXXaPHqM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eBR1lDAHkxs+NIY/KmvwUOkqCW7ze1/Nbv9wHtpTZJxqBDcC/Mych0A1LZQRySWFTi9g8WQh1Ny2ZRB8SCPsrs7UW2XsobTfxNrNr0enuaoQs2gvMMnD5aGvbzav+HJn9Nv0Wyl247mfhR+PmrboHs1k+WLQUeqPEmzCiBx3Xx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4+yvi0Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JNIUlDgi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4+yvi0Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JNIUlDgi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCivO907769
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 20:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K3NdLMxVT8hyMSZgwFoPCL7F
	pdKCgNlTeb97WvwOgVA=; b=M4+yvi0Q2drUeVzdapFX38mgqhU3/ocdnfxXVUXi
	qdzarfXCt+M9P/a+l2So1aPiYU36A3FopVubUW5AvtQPkK59VzRMQFwguGwpfH0u
	Y17CE7kibCTseKGMdIJKFurb7eE+UX6PuUXKAEeyzTu9WGO9CTNmj3IzIJUuR02/
	PZdxeuegG3XSIaDbidB4iLycVROAN9B8RRgw/1Ed59HXuoPmyLBcsIbkhkKlhhzy
	0bxEzHty7JX84g2KSOZhsZ4WfhxPRGf+EAzht2FrXB6dhT9PiTNCZhCuX4lBUFht
	fmN2lVbOe8n8rdVx/0QguPePzINvrF659nP0hanfJcGvrQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3ukm9nqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 20:57:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b31cff27fso21958171cf.3
        for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 13:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774385854; x=1774990654; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K3NdLMxVT8hyMSZgwFoPCL7FpdKCgNlTeb97WvwOgVA=;
        b=JNIUlDgiiu8zNaJm/eiM2unDqQ9qS5uMBe1XEw7UCVRieTE7H8wVhsS5VB0CNKo6Qf
         AC+RH1NemKUxjOnKG99SDg40TuxcZaG5htwQOsc+IZQN4TG8kg8urmcuAP1GHtoBGnEl
         qaZuOyCinYFpd78fPIQdGLG1X3UR2iSvIWQCezCmrlr+MqdYckflSalF+xLGZVaXiIhP
         2xiGmnLrlJ/D0hrmjAb206BcAmOGjAFRo+taUANpvwi8pG2o15c0m4eG17wXT1DaOeyV
         OuDnhOU0R0z7skarLtkalgQKRPt1bEK15Or3doMF+rNwb2t8JloNRA37P8PWwMSWN1Wq
         aL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774385854; x=1774990654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3NdLMxVT8hyMSZgwFoPCL7FpdKCgNlTeb97WvwOgVA=;
        b=GNrD/0KVuOr2mASMPz5LLNq94LVtlaqujR71FvYjoowPDhh4Hhi2aORNOSf7wNKMwu
         Y+Ilhlurz8vGcEN5oNMqxW73xIJUDqM5ZAhOzZkZp7RdI36d0394WxGLBmZpV4avirk3
         vasohtrGGoOx8ICgmDw3fPOCmIm3YnFw2ekA9rwLRhUNB5ipL+qHQBW6KiW9M0Jh23IX
         4lZXi4WRSYwn7eE7D2JaYUOJU3D0C7HLvtg5RlVShnqoFNIr0vwps1lAbWyiWkbBg19Z
         XGqqRPJqbCzpP5pnu9fItkCP2/zN9I4tOCwzMpY96VVPhPbRE7SNwE1rtqCmFmAphaMW
         WHxg==
X-Forwarded-Encrypted: i=1; AJvYcCUg03uWsFr3RTSjD00dMInRukPgDwr3JGhqQpEvLuqSx7wLeeyhdzCLOUg3yKiH5cT1uJODzaZ3TnM3HA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdloVforJwNhJsy6Qdnb8S61F3vWCKbB4VDcMNnvVLWgNPglgh
	6LnQMMFzNiGaZ3vKctSq4ED94+41SeIML8Lux8Ud2zXpUtjo5ccTvmYCan8sgxMsa5S9Zq7wxCF
	v3pX5+qkIuglHfEu1hOslhOuFPjThS9B7NEbL7IEzQ2/aEFpneL9LYexEk4Duh0mgUQ==
X-Gm-Gg: ATEYQzwdDb+ENey/x3dY1fz3ds0dH87mHPQSpwbitNpyd8p4vZ5JsjewfZfX0Dmi9l0
	Y6NmoDbMDcLAkoBIrHPMXE/RuEEVRT4bYh3rohtDLtnEqK1Ln+VH9lSwMEKRM3H98kTrCpbdsE8
	5hBIs5/okhBjped7cdQsTni4hp8OextIOm2Pt6kKUY19l5rYNDU7k/kyEb5taA41XBVjS0FD+20
	RSNqTCFS4INp5Oevlun2GJ7b4YE51PlGr0UEyPZj7Ai+TZ+UFwZo9exRjLNnu+TX7be+cVYUUgy
	l86c5cWWLWJwQyO5CJUEiHLhgQ1nFJJYZa1lW7tC+fvBaKXAYLLMyzdiylfkuhkcJc+AP5hoD0L
	RM9wtSAuPJViofk4A48EHVgwwD5tenHy27qPQGzA9+LvXfpqcatODo4Qtkpl/Ol/rR4KmXKmLZk
	plv8uxbIQCioktqm+7vbq6x1JAWTMHWvC84GE=
X-Received: by 2002:a05:622a:aa13:20b0:506:a624:1939 with SMTP id d75a77b69052e-50b80e8a8f0mr14116741cf.51.1774385854012;
        Tue, 24 Mar 2026 13:57:34 -0700 (PDT)
X-Received: by 2002:a05:622a:aa13:20b0:506:a624:1939 with SMTP id d75a77b69052e-50b80e8a8f0mr14116521cf.51.1774385853569;
        Tue, 24 Mar 2026 13:57:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207476sm3402419e87.47.2026.03.24.13.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:57:32 -0700 (PDT)
Date: Tue, 24 Mar 2026 22:57:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v6 03/15] arm64: dts: qcom: sdm845-lg-common: Enable qups
Message-ID: <ckq2s45fts6d4vreghu4h6i7bodjdxqfywv4xmeamdrkq3ucl6@fl4pjnczi6cn>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-3-29d70ca1651c@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-judyln-dts-v6-3-29d70ca1651c@postmarketos.org>
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69c2fabe cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Gbw9aFdXAAAA:8 a=wMieUAD5PgN2zKFp72wA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: yeUlSZEg2JwXpKoSILZAbZZKR5lG8TC4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2MiBTYWx0ZWRfX1wZbh/PtT2or
 qsDt41A/nv2RcHja4NqRMq4Mfxg+7WbOjDO9qJtqrbrxbyOOp+Nf5VsfdA1vzDnDLke0kuBJAjb
 LbGwPb5k4smejW4Iv/JfsBMIuHsdSna3g6FCYbvSJNBpj8bsbyGReslKOIVHD323yydZICKeKXM
 9KcIli8E9/EDlTMEOK/Ux4zRYrTZU2q/C2bUiE3CJjQ4MK0atS2FC56AlN4Nc6V10sD+cqlA013
 rObQAEgsSnPrOUzkBSSg/DhKGdiW5MKzwykUAn3WfJSeZwybUnXBeTGdyaz+qXIsMKhpZx3LTxa
 N+o2A9Pz1QOYSzEX2C2m2rNNv+l1HOm4ZcG958OuCpmB4dzhKC3l9BqSy2eaLpaYN1JAdbPa0uH
 1zb0XtyWcTsUcC+9vn0iDKFLaxLGx0KwdcPeJeV6NkLA8d0QXnd+4BQATlsmXDTVAQYWAlY8c3h
 xnJS+ilm4qhOc/lu9lw==
X-Proofpoint-GUID: yeUlSZEg2JwXpKoSILZAbZZKR5lG8TC4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240162

On Mon, Mar 23, 2026 at 07:06:33PM -0700, Paul Sajna wrote:
> Qualcomm serial communicators required for i2c, serial, and spi


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 87ac41ec2e46..eb8de8d01177 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -482,6 +482,14 @@ &pm8998_resin {
>  	status = "okay";
>  };
>  
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
>  &sdhc_2 {
>  	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
>  
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
