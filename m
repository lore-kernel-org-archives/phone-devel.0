Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D38246766
	for <phone-devel@vger.kernel.org>; Sun,  8 Mar 2026 15:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772982490; cv=none; b=T1o8XVWssnBoUmmJWAB3PEzowvD6aqRLUxiF2Rr/vsGvn+kkb2YHhBhSXBbyjQUMNQ5npqsI5jdt1g2TPwWibINYwO1aWZ1/W5qr7WjWbjHsNye9NH4ig+v7JWMsNFhIifRbq/usjyeTbUTvJNGdrdgPNMlHwp4Nv3kM9mtrboY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772982490; c=relaxed/simple;
	bh=KWgTeiznsOPw5APcw52eXBaL1ZGPPaRvhNjWLUEyR1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNIXkrT9S4O561DDyff+sDhS2wBPcY5nW+7FP3rubM4DG4oU49lTFClelcVUp4RqDgc/bxym5RNZ1G6BgCnrlR7lpMQJFBAjqr3yaOPI+0LMd8LN4oL1fUu+aGxyfRSFsOT/gPeOtlKwFDSmA1smCersf78rXjGeJJuPozqcNpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GmMiHMVb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LrtNSbTp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GmMiHMVb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LrtNSbTp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628CM4VZ823536
	for <phone-devel@vger.kernel.org>; Sun, 8 Mar 2026 15:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rvi08IAd9UMRUOwod1y7p+91
	CSiqtivUDxTDdSrOr7g=; b=GmMiHMVbeCQiWsPlbn6WHGb0GF8NtmZoWnoeWP9p
	L8pa7UmWQU6B4HTpfg2OrDHFH1fjEVG7/TZlf3n21XPkbk4LOWl/xWUXex6WlsA9
	3Ce9CpL/Avr+F+4F0mDy7VJbICyTexbr4FgCd/+f1fjTuPzFbYfjsMziVYhQ/PlU
	F3mV3StM7HhdnSQAzYGpUG7oiJgtKaGJlXvJAOkHCsr9X9s3n9+d8dAu77oSZuqd
	KYzhCitu+22V1AfCKPl/dF6UbifxbJ6BLk/eO5jf93KBqEMuKP5K1uL0n6Q8NgGv
	PUaBze0S7z1D0i0Bwo/0nUV/5nCVM+NGtcuY02dJTiNRWQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crda9ahd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sun, 08 Mar 2026 15:08:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd81506677so347028585a.1
        for <phone-devel@vger.kernel.org>; Sun, 08 Mar 2026 08:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772982487; x=1773587287; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rvi08IAd9UMRUOwod1y7p+91CSiqtivUDxTDdSrOr7g=;
        b=LrtNSbTpTAB7RUFBxZqbwiDP0wbaIjwi6xk+ROzJ8ypgH4/UANemu0YQxCKqeEO6zP
         laBoGfPmZAjipwzAHAa2kexoqCf66dh9IYr5q1mxO/SFB4DKMhIM571hn4ZcAijxiZlT
         ayRLFsAEEyKDL5NdmVd45gBg4urZ+RPFOStoFQ/3RP+vKdD3QU6pSd6G0c2Ir7AOZTjg
         vb3Jsq/djnzrsR5bW6kDPuKmGR7MNPhqwQPw1VKDY0K4DaewoKxipVt1DPKBqDfP2lhp
         mEKAl65dyziYms5QsBcdPR36qX3UJXVluqTnP4pi1Iz/WxS0rxrqNlmHHBEuhYruEa+r
         f+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772982487; x=1773587287;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rvi08IAd9UMRUOwod1y7p+91CSiqtivUDxTDdSrOr7g=;
        b=B4Q5Kg4kt/PlTMkbBMTS+WnpSrHMVzD1FAVwXe5J2k8HEo11XOZvk0OqgjSd+Hhc8j
         LqhaMqKviIiabna6gvzQpMCy+ZksbKPoUM9zq+4Var4qvVdXLdcPpILS46Np76ewV5J7
         YkZfK+1RYTUL7xDJ4BVPblMT9J+Inf32WCSSqvXWjmuBfMv7bpMbfsywq+jzA2nr26UR
         EJ7QJNk76KIltqqEafqSZNeSpU4oK0/ZNF05zmgsigKip1VWAROgt649Of/Xl3NMufS+
         +z9gytwLDvz8K2tPL6hot7WrgP0pOE2FK0BqtcdvB+qujHPTQFco5qcMD4+DdC7brivD
         he9g==
X-Forwarded-Encrypted: i=1; AJvYcCVbns3pa9aQrxeTg6Rdg7sq3kfNkuJ6DLCbXYA3N7+Q97ew7isRl2MMcLNmOJNnXnRNz9pr7Yvj+H4QfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSpLumnBJanK2lEQP22BRCEQob4USITlXnnAWY8sgIQ4wiKjaS
	QvpjVh6PKhcVTt7JLTNnXb/PCGrVZXZq4iNtGyu3BGCUbPsuLiW4isCmMR1jwE+Cr/RMWFUi7lx
	sYLMCRm6Sg2QMrFTTwyjCKdcqaucEtSCkwjxp6/FdjsJGmEA7wpH5+X2mn/oVHUlUiw==
X-Gm-Gg: ATEYQzw7VK7xHXSnphV0fp69C7L9S9jYQaF9d0kpdxw18jbhPbkzoJA3zq3WC3YCBUt
	4pNqRKnLXnAvYCPSYNqy1uTb8PZw2lH4OcSQcrS2f/3laRtzpA4B2cQuiuvi7t7G5hYf6yIBwvz
	lydoMdAWLQ2fV3bmhoY+C+UxsIFIHdQ+9+3WDgqwWWM7Jt2/UH2o65G1EuF0sQIwbwk9D8C+DDu
	HRkdxA/c7TsJYoam1FGFaxsW8ltyQN2/FClqv+d86GtwSGg2NkAYJmslVGyolFDsa7BwQ700RuD
	zQ3mPwTh4jtzaj2kVxxmWomOqfyovkmp3DRBc1jFkDzIWW1RuhczcsmDBKqhvQLXns5/7ywNxnr
	YuTA3fu7bucjgILX406i6NYY5TQCQZ08TVKXLmSNbchV8dWt5Fpv0z4iEizX1+Ilz3qSewR38zl
	W41y0B8jj832deChRRChpoaMlyyikOZkNNz7M=
X-Received: by 2002:a05:620a:564:b0:8cd:7f7d:b091 with SMTP id af79cd13be357-8cd7f7db19cmr295648085a.71.1772982487390;
        Sun, 08 Mar 2026 08:08:07 -0700 (PDT)
X-Received: by 2002:a05:620a:564:b0:8cd:7f7d:b091 with SMTP id af79cd13be357-8cd7f7db19cmr295645485a.71.1772982486904;
        Sun, 08 Mar 2026 08:08:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d07e0cfsm1483302e87.43.2026.03.08.08.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 08:08:04 -0700 (PDT)
Date: Sun, 8 Mar 2026 17:08:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci@protonmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 4/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 WiFi/Bluetooth
Message-ID: <gn4qdul5tdm26zfgem3y7jswucvbk4jb35pabw3uf6zl735h4w@6dkrl4najlhd>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-4-aa2c330572c0@protonmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308-rimob-new-features-v1-4-aa2c330572c0@protonmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDEzOSBTYWx0ZWRfX0IhTGfdR87jl
 sdPJY25F2T9p8d98T4x+jYZuOVNe4xJg8K8lwMZh7pF82SY4oZPp0bp2H4oyOhrrcFUU9JKbFXF
 fkWs0WlvL4dEb/CPq5Fxag3wpBtXCPPoXcSPURQG19E1B8mB7yMnLB2zBH4Rm9JUfB49+mk9P63
 Xcyl/RpGtj4LW7+hT06F3vh1Bk0wclLgWNOOaBRANVYacnFZWfKEDHhYTPDGG/zhi4OHAy1Hoz1
 QkiWLhu476pWYDaESxy1jpkfwmRzQrwxd3M168dC00sAMV35VF51MAAmmYYCUQpey45abZG29hv
 mU/e51WNvRdH7svzyKvBVshdiJ1PdoaacPSa46wLkPxJJE576HUoC4X1uu904yOkbsYb7wpalzS
 fKoEa3S9sAnM0WPU3uUiAX62dJ+L3KbL4kTLkuC+hUz3u9Gzn2G5xTwFXmSrSzuISAgr2oUewjF
 5VGj0TtAl1MCrYJ2e9Q==
X-Proofpoint-ORIG-GUID: 2NM9VqJs3VSlUi3cGgM5uvezWADq6eW7
X-Authority-Analysis: v=2.4 cv=QZtrf8bv c=1 sm=1 tr=0 ts=69ad90d8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=sfOm8-O8AAAA:8
 a=EUspDBNiAAAA:8 a=TiCh2U2r927ZuiwL-uAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: 2NM9VqJs3VSlUi3cGgM5uvezWADq6eW7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080139

On Sun, Mar 08, 2026 at 04:52:44PM +0100, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Configure and enable the WCNSS which provides WiFi and Bluetooth on this
> device using the WCN3660B chip.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
