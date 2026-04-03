Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16DC2FDC27
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 19:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775244914; cv=none; b=jsn/VQnO/wSDknnPiK1opj0cre93l/SR9b/k/fDExpR2lE+BSBkX0NbAUqiqgZvf8iScr80dO6hrKF3GDDgY26FPCMl282XyHmMdOJqMEE4s1Jg2l1uB4qm/+4oSA9E7xD9D3aWik3tkswbMuIRAQBcM0gA6P6pcxyY4TwNFKFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775244914; c=relaxed/simple;
	bh=fCyKv6n213CXOIp+7Tf/ucX6AW1UwYyK4/dzZ0nNAjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhRvn1Mz1alx0vbTkGzU4gxQP6dZG/8On3SBTgnPICt4JO5YZ9a0O8IYq6cUk/jZLlepfIc/WYmiS/MIeg9wnkMkzx0MJqXyM17PGRSXVpIsHwCxmB1qecAH0S099wzGMsarqlbGvONuC7pzU+weGQvb0/C1S1VOopMzi/6xzWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NAwY1iFN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QV32aghr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NAwY1iFN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QV32aghr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633Axx5K1562147
	for <phone-devel@vger.kernel.org>; Fri, 3 Apr 2026 19:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O/uAuFTU63ZTQFXA0UTCPixz
	BtzDQ6AHfdS8W91kFzo=; b=NAwY1iFN7wES1XbF+qYwbMkPS/sIEb1shxK9mmMQ
	eQhYi3VUmLjeESXKzt3ThRo/F63wV4qQb7INbB1W3UOrR80an/6Hu47gExXYbYb3
	nHSG/SnWFMD1bJBwL9ZkVF/uEGSxrdA+ZLkm0Oc2pIe9um/B9b7aVOq9NoaHuk/Y
	ZXDUJMyDkZgVrCtbqIRC4h++0cWg+4u7+eLls4PzX7Ot5eKmXeu1r3c//X8rzLeg
	c+zSjZ6YK/IHh0+0mnTtRD6BCkfjzaNfZLJgalQAqt2ej1oPRuhpY9r9wxbsGVuJ
	J+XT89XCIWwLlh0JqQldJALVd73Eo2cqrI9k4g4dYboqTg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9um74h4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 19:35:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b802961ecso29070411cf.1
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 12:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775244912; x=1775849712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O/uAuFTU63ZTQFXA0UTCPixzBtzDQ6AHfdS8W91kFzo=;
        b=QV32aghrMR9VPflPd5ZQXJk1rFAwsnMclmpwh4udYVE3EgCitGxig+EhyHRgkNZFdz
         oKMxGJIuIjz4YAb7vvPw9ir2OwXKA29PHzr5wnOINzjwn8K7Kc/Y3wDaAgLy4gMGlZ+A
         PRpKBl3zmbJ1DC2gJglWuK0upCgwZZuV4WAWI6UdDrzjTj4RrmczEI2PZofY5J0TIBTn
         g8vXnwI9a3ycNcFLMVRs90d0yfLTFBmM0KJIJ9109qkLODBNYFrSLDacz6tC9C/aqe6C
         VG3rIU7+6CbpRwigUb6tumwc9WBuBx6oopcC7faeDSvj0P0Al7DSulYYoD7UJu1R1BgZ
         GgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775244912; x=1775849712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/uAuFTU63ZTQFXA0UTCPixzBtzDQ6AHfdS8W91kFzo=;
        b=fCEAY1PwUTNiQo5pqTaPmWnz998unKti2rAa7w+BqBjDrqWAQ8XiFBCnLRuuurqyA6
         Zp+HdlMi3MM6Um4FHrojd3q1JcoCK121KIek7tfOae96TPjxjAiwt/DcNVo3b9hKrLzW
         HncdV19ZfME5xIe5f6xiqzLw5AA7hHb3QQPhfH6nyu7A+2VBLSxZPKHyahSACX49fVAi
         GArZ12zfaFn3hYzikcHEUa9rbM2fcJNQksooU3YmutaErfxtR/xJLLJByn27nMIpyzk3
         lOnR+HTOLbrrji7LjHN5I1PdnNAsijbK+1np+ozrGSX4HkNivoZJeT35pRho2VWJ5Tm/
         IMQw==
X-Forwarded-Encrypted: i=1; AJvYcCVrMFBBF5ERXdnQHtAM/kUJn+BfXoxcqTyBSHJyngPggArhAnsR+9TQsW4h/bhbmiUL05be0RsWhTil5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyZvAkykydJuQudB+Uj4Av3GzS9Lb3+h626QseveuetzJD5kBX
	G33aXWLpHiluhNEy/4o0ABFSKZnfM3S9lKRPlyLeT8LaAZbSgcRq0WZPnlrK+U7WZIll4uDZEZH
	uYvW5utz/KObWrhAf/38QcjXIspm2Op9cwOWXzOH1C2QfYuWLjScJLW8zGOJbMFdZ2Q==
X-Gm-Gg: ATEYQzwAojNS4+0jcmZ3Hd4M2wGkm7vfv6lDDAvPbNvUgEkyiYtZklREJR30EsUucCF
	66cb39UZbKTxrzD6UhyEJl+WAkMfZTj8BFeuSSpeIVhn3dEVdASdyC1JVwKB8r1R9ztVoDAUnUQ
	MYZDHygxEImrgdVE3SYw7sx42OwkWutcBiElaSCk6F1rnq5+f1rOtuLjacLHcv8WlLmBnO4+QXG
	n4ZpBI/mnA2Z/BAKXfPfhGXAVGdphKzC2qvpUxNe4Nga0kYZQJFe+CnDiAhytWU/hbTiTx7qpau
	jBhvRPb9T9r7N5H+yB0gONPEgqmD2V9fT4BOSoJbFgkhmZ2EwFZpO2/KhL+u+8SHwHMqzfm0pqc
	IMlRbwZgs3/fjhWc+B1uiW04N7WS29vwAzF40/7NcIN5XzzsrpnQ3TWU41YGKzlXvdc7SDISguf
	2PLOftMegXw1Tz9wZgReFS4KZsMijNonwiPpo=
X-Received: by 2002:a05:622a:1f0d:b0:50b:42fe:d2a2 with SMTP id d75a77b69052e-50d628bda1fmr64484761cf.18.1775244911954;
        Fri, 03 Apr 2026 12:35:11 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0d:b0:50b:42fe:d2a2 with SMTP id d75a77b69052e-50d628bda1fmr64484211cf.18.1775244911443;
        Fri, 03 Apr 2026 12:35:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c951b1sm1664908e87.6.2026.04.03.12.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:35:09 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:35:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi
Message-ID: <4fbs4arx6sez6fffy75ctmzecfvitr6aocau3cczlr2ps2ptld@v7wpa2irsihl>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-7-393322b27c5f@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-7-393322b27c5f@fairphone.com>
X-Authority-Analysis: v=2.4 cv=U/WfzOru c=1 sm=1 tr=0 ts=69d01671 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=Ae2tQB4DPc1jRJoPbowA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 7pDqBD5RP_EAEgWRTy9ctw99QEPzc-Dk
X-Proofpoint-ORIG-GUID: 7pDqBD5RP_EAEgWRTy9ctw99QEPzc-Dk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3NCBTYWx0ZWRfXyaWd6IOnH4eo
 c10qazJHFLimN/LK1sT03MlhBqZW9OVpEhUCOUVd3jwoW/1dgIjgfi0bdDlm4N+QGbIyqLBf1I4
 NJ1s+YlZfKW98bfHsZR8IKsq6OHWOVnffaOruBy8+fHVcyVombvASh45ouNxwQDJd1EcEarsEIr
 1Pm0jDyNMqZ1X0zKd4JE3+/Ay6coDmtAEtwNay/tq//zhqOi6useKzvkEpAC8+iXcGeyYx1FSp4
 nFmrGnqW2QBg7TD2dwQ2kd8xYeT6xtBu+xWRqO/4rGws5r5cQVJ1jQit/VCFQbA8L5luqwk70kA
 YnLzExb/DERq+p8+Sa1/EnoS6C5dh5Sl4PfRh+gf2ifS4/5HxsSYlvrwyMtVO+KS72UcWklgFdG
 WCBo6A0gLp17da0gmXhqcgnE0tWzL3VdGyYWuaRGBilGMRwUn7Q5DPMnTKf5arZ0KMG4v677Ed8
 vB40mmOAYz/BcNN6Jjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030174

On Fri, Apr 03, 2026 at 03:52:53PM +0200, Luca Weiss wrote:
> Configure and enable the WiFi node, and add the required pinctrl to
> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
> 
> Thanks to Alexander Koskovich for helping with the bringup, adding
> the missing pinctrl to make the WPSS stop crashing.
> 
> Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com/
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> index db72418b7195..d8ac495ca7c8 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> @@ -242,7 +242,7 @@ wcn6750-pmu {
>  
>  		clocks = <&rpmhcc RPMH_RF_CLK1>;
>  
> -		pinctrl-0 = <&bluetooth_enable_default>;
> +		pinctrl-0 = <&bluetooth_enable_default>, <&pmk8550_sleep_clk_default>;
>  		pinctrl-names = "default";
>  
>  		regulators {
> @@ -766,6 +766,17 @@ &pmiv0104_eusb2_repeater {
>  	qcom,tune-usb2-preem = /bits/ 8 <0x6>;
>  };
>  
> +&pmk8550_gpios {
> +	pmk8550_sleep_clk_default: sleep-clk-default-state {
> +		pins = "gpio5";
> +		function = "func1";
> +		input-disable;
> +		output-enable;

Hmm, if it's a sleep_clk, should it not be handled via the power
sequencer?

> +		bias-disable;
> +		power-source = <0>;
> +	};
> +};
> +
>  &pmr735b_gpios {
>  	s1j_enable_default: s1j-enable-default-state {
>  		pins = "gpio1";
> @@ -1049,3 +1060,9 @@ &usb_1_hsphy {
>  
>  	status = "okay";
>  };
> +
> +&wifi {
> +	qcom,calibration-variant = "Fairphone_Gen_6";
> +
> +	status = "okay";
> +};
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
