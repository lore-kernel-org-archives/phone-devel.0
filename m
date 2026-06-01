Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AD836A361
	for <phone-devel@vger.kernel.org>; Mon,  1 Jun 2026 11:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313898; cv=none; b=nJY0dDIVCSJlCAh2gHQwlNgalGWi9NitPwwd8HQr6dPetVMwwMXlySCe23gYzs6ai17BMQ27zTnEECRf+h1HAIQQ7HjqcBApUS1sx8aUVzQXfAalKWStu9496IB3mk882jWWIhNRIVLYSTsRj2w4XUbhNSLPBCRWhDCPuzkfSEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313898; c=relaxed/simple;
	bh=SWTIaQyUE0hLCUIIN5L1msdquqlW/MHKkBotVFsNjh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U9DjqHaYCLN+WwWyWblAxvbL2uep3dTKQ4JZNZ2RS/lmPDO3jh3OGVXjyQ0RiXwvMzR8Vep4p57/McHm+RKGISXwP1fg2ZVtdJfOEjZMaUKH+hmnQHkHkfV5wV20s5wPxZx2m8EBDGdpc6EEBDRfPZ6al11XWGLmf06HP2TOAWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oX3KzpYV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WGmc2PNy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oX3KzpYV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WGmc2PNy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651BBCW73128068
	for <phone-devel@vger.kernel.org>; Mon, 1 Jun 2026 11:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U2uhUbSn+d0+wL/JaSPYQdq7
	U5EkDujpLJ0FBYZnkRc=; b=oX3KzpYVOqj2ALE5wZmlP8c0N8xuuhE8BR7mwEzs
	s+ufXextn5U5hNhtoeqlYFZsZJycNhDXJMGvQo650tiGUgOKgEMOv6tvyrT10uPo
	zR3+OEE64UWnW6mMzhlMgejt//eXZktSoYLoqlDW2R0jhuxF46E6PIx8Nz0D4aB2
	oUi8xAWL0FQgf24uMvSSsDtoNy7/13IcL7eRRbmiyIzKXRbKNLP5Z2LQKOPIaudw
	dshGRd7FOFzMtU7NvyRb3qD2wZv3MGGyyjcP45PYGOfOXPrJIN/ZPcf9qeHsGaBA
	sBojjBC6mMv8m9wRJtw3vD4V5EQiY9+dKCN+sSvXmbb1lQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh901037v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 01 Jun 2026 11:38:15 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfd441619aso376909137.3
        for <phone-devel@vger.kernel.org>; Mon, 01 Jun 2026 04:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780313895; x=1780918695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U2uhUbSn+d0+wL/JaSPYQdq7U5EkDujpLJ0FBYZnkRc=;
        b=WGmc2PNygVeB+sju6wa09j9LzH9ySUhgkUD3+0nxbY81sa+zICSOgm1lHUihBLL3vH
         Y2gJoKLnVbB0N0CYr7/l8Wu59S2IF1IGimQnev99QPxUaWNT50YPcmKocmQTwVO+T63m
         MUWBgKsvC7qz/s7tSN5BiwxTF+3t0ZCZ5Pk2PW5wjIljcy8pELAUiYpJNTfKk8u+QrlJ
         PxkeReTAd7BdxLHp9MYbF5icm12U6BHVaWldOnJsXJ3GTpNKNx0lKX0CnST+L+EZiIYT
         RFefdUDiGqUeBfvNO2gQPgciwQCMRUj+NjZMTurnIgok58JGyGErmmiMWUD4pqxvHtlT
         9Qug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313895; x=1780918695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2uhUbSn+d0+wL/JaSPYQdq7U5EkDujpLJ0FBYZnkRc=;
        b=VFZdvvyZ7RGnXNGYed2TaKmhpVFwUMI21KJJcUEzEgd9bSEsnV4QOr9iO3XhIhUm1C
         69jwPFO5Jijf1z8+twJOVtxHXbA5j7EX75/so8V0Ph4TYNFeqIvqXN6oYtKovPcwTm/j
         SJfQUJ88he+++63XdWtp4gE/ifm3F/M+spsTujGEvRiTLnkBsAtYtk+me8dHncK4x2Wb
         1jhPFQgTevduJWzOqE/qPEsXBjZWOADG9spxUnSkueO/iB5Hs9CKvjnDRjjQad2Sh5k6
         AfoJNo3lBGmGR5x+QQj0Tk66WCfaPJHSO602agMxteBPY79r+3WoRz7r4GTtjQXfu93I
         M6Eg==
X-Forwarded-Encrypted: i=1; AFNElJ/f/n/uO9RTl3lc1uDZwKzjVL6usQWt7G3z4M7HZV//OrnHH3Q1eu4ouov9EUS8SnXqxrbV0rMsTYdZow==@vger.kernel.org
X-Gm-Message-State: AOJu0YywKKySmrQZhXBf/Mx/v5lFeG/tDIxFxVIVPmoqIgTKdLvBTPvR
	BgffcgfMMAybl94YmLpyMg1VI7SDeJBZXYc7F9vmuu00YB+GzbYn2Q7pSztYO3zvuQJ0aGXjHSG
	s6jbV3Wz9mOeVZ+eP+VOW9SU6jQz8h5Mt+z1SYEpVDQbV/y4dZ0txW5R6ziZV6a8hDw==
X-Gm-Gg: Acq92OE0F32ZJzUs4eNPyqUmVgwgbeKAFcw5soQ7fhWPDiOo28GFMfAeNvbWVtzs0Uc
	hstCO3ldHmddREcw5KMxuOrVq/kSB8zV3FtBgcwQNnRRjXPPYE/EVNCi0apGcN1ru1thpnWJlxa
	bCfZNdOL0C8878a7dB4Cp0muE2oBPgdazamWYg/6sTIT/esEXLzEPRzE6qu/WuV0LQQdVyzxCCu
	Cp4lEpKQMBO1ltCWevGlrGul8CygBaCw/7WTgQlzdD1yiuJu3CQ+oVI0e+hNx25jnaeoR2zAf2/
	q5GePO246H7uYPyrovONI1/ZtwF//n6/CcRwvh8dmJJ3qbOSkwR84+PPqNTGveVt5iNqLtHA5bT
	ssClxnFQDxSi0WTJUEJb+QmtE3Y+gX7YUrsjrnAKIjOcdHAX6BEMwFCmgY5lXBH5g6eaVUqJFn7
	5eb2GNSnQEuFWxLxEm1Mx7mQjdRT/Bf92WO2rC96wUdzIfqA==
X-Received: by 2002:a05:6102:3e22:b0:631:26f6:7009 with SMTP id ada2fe7eead31-6c69b078cbbmr3454924137.26.1780313894855;
        Mon, 01 Jun 2026 04:38:14 -0700 (PDT)
X-Received: by 2002:a05:6102:3e22:b0:631:26f6:7009 with SMTP id ada2fe7eead31-6c69b078cbbmr3454894137.26.1780313894373;
        Mon, 01 Jun 2026 04:38:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b06879asm2022024e87.7.2026.06.01.04.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:38:13 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:38:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux@smankusors.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH v3 04/10] clk: qcom: clk-rpm: add msm8960 compatible
Message-ID: <rvs5c4shgeroxsllqtxyjtsrb2447yprucw7qtmeissbbxtvtb@24nexo4dy6r4>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-4-fec6ac8dba02@smankusors.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-msm8960-wifi-v3-4-fec6ac8dba02@smankusors.com>
X-Authority-Analysis: v=2.4 cv=H6nrBeYi c=1 sm=1 tr=0 ts=6a1d6f27 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=wxLWbCv9AAAA:8
 a=pGLkceISAAAA:8 a=5PoCL-xiRuW4qANWJgcA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: O0qPI1aMMGPVq_bWID2DDcLz6AagEwAv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExNyBTYWx0ZWRfX+j68oaWgb9VI
 QtGsUZGAguFYgPaejzK/hrFKTd4l5hQYwmFy8Rf9mFVqOo2/E8+/U3bq6WIhTJ02D7F57xGIZzu
 gElB5cy7j8c7sr2bIV3jY84G7iaK0//GL5hqp0vbcQ9DvjCeFvnLnxje+8mLdH5qZdx/5fVuvjB
 MwH3OtOyLnLe88kwLGjk8tQZksQHZkOmH7ZCD/nP7PU/Stc/lieO+26+WUIc8sfjwgO6YtXKXu8
 frUhIY7WI4ucbz7mLvrytppGqKYPuGPNN3LpHnYXm6JabPxG3X7/4+UZemyOsAbCV3v1mUMBm6G
 YBLBXKnpQST3PbfTKtlnydQitfiBItC9WaC1COgCyaqaWqXYwj7muvnhUbLsdNVxiK0oHPSQbG1
 +i8DMzBdmFMguJlS2DxRmcSMHGbegTU+FOHNirNaVTq1QdA3lIIfaz9X4r2LXe6IM0mqTXMmFd4
 ubS60eyBQ1xxI+Lmvpw==
X-Proofpoint-GUID: O0qPI1aMMGPVq_bWID2DDcLz6AagEwAv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010117

On Mon, Jun 01, 2026 at 03:51:17PM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add support for the "qcom,rpmcc-msm8960" compatible string to the
> RPM clock driver.
> 
> msm8960 uses the same RPM clock descriptions as apq8064, so reuse
> rpm_clk_apq8064 for this compatible.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  drivers/clk/qcom/clk-rpm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

On the other hand... You have added APQ8064 strings as a fallback. Is
this change really needed until you actually have SoC-specific quirks?

-- 
With best wishes
Dmitry
