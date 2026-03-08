Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315371B4156
	for <phone-devel@vger.kernel.org>; Sun,  8 Mar 2026 15:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772982119; cv=none; b=murBxDKQTvV20AJgYf32KU9n+sh7XF/T9vz+6e2eV7c3u5tVv4QtS4oee2Sw9xXPbvZVy+IKXasuOlMhN0EGglf/rBaF1BVs4d5FZPz+wwGaP1ktHafj1NYZhB5NvkTN2WE6Yi6tB+ZZVxS+URGcz3tja142Cp35ostpd+M4LXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772982119; c=relaxed/simple;
	bh=CsAcqgZ1zLO44aTm6JqflT0W6rXcO3EjX/0HQ5Q8Xw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZy/jXGifdUgN62UCadXwoW4CLxd32GAmLbmUnoRP9AgKnwpLaTwF9bsYGY9Kwaauh24nh8grfPfPuQ6oNW0v73tbU4WnmyVZ+GachCN79dA/c7WspGLpdmRfbgBiUHdokLid5UUIt7IzjX4QKyhGg0p2MMyAefjv8pIvbizPmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o+aD/xbb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W01um0OO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o+aD/xbb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W01um0OO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628CPhQG3683510
	for <phone-devel@vger.kernel.org>; Sun, 8 Mar 2026 15:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BwabE/ZDUGVLXR5B0ijRMwfR
	m6xlXcpiu0L9ARNRamc=; b=o+aD/xbbiF4bgwIqiKNgkFdNK4W2eGuccsale8Kg
	igvwigaKcX9zTQywkK+vPvTIVd7mycp+/f6uldTYsaOQDwhwNL8MivVT7ZhZQCsz
	gT9+kAGGpknEbKiDz2EQn+ujTEQ6/U9i/rAvZyPn3ou7wD7hOQyZvjWVD6/ielPz
	qn3ObNUl08WmqGYF6qvlx4gqjSaD3Q/i9pzptxXs0W4ofL9oouFbd7pLA4ntTaqR
	6i/ypu4AngKIX39/D1MT58Eo8AiN0lZo9NiJS63QhqajfFaxmwL8idW2ugjcE2qA
	pUCHsrKJ3yR3cpzSNB5EO7gC5bzFTPh/321VgKzQnn8xsg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crb14ttnr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sun, 08 Mar 2026 15:01:57 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-94ea014ec7cso431191241.0
        for <phone-devel@vger.kernel.org>; Sun, 08 Mar 2026 08:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772982116; x=1773586916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BwabE/ZDUGVLXR5B0ijRMwfRm6xlXcpiu0L9ARNRamc=;
        b=W01um0OOHd12jIHhtr0dBLB2cSbsasvDwCKAeEUPeUfL66wDy0WTJsTOjzxRiY7SZ9
         ZWSXviNRIdRt/41HXyA66C05lKDEHAmJHbcdQfr5FNUrM5XXEM3aY0gzyUd9Nv+cX9V5
         lfasCACiJMC8mzDA3pVAvFYt9WxfHUyeHEXJRqdY7Jr7y0WuEFNTSEzZJChyBXibQ5Y+
         PbXpzKfpVMVV1uFBgwqMr/IEJg8kZFLYfQAEnBO3/hctYoW3GGyamNiOmA7elqKnEC2G
         qtfH2bhpxCrpip8NsBolNYovlV+YRP42migYv0ZIhu/vIyp+hPcz2YlO91Thr5G4GelZ
         HLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772982116; x=1773586916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwabE/ZDUGVLXR5B0ijRMwfRm6xlXcpiu0L9ARNRamc=;
        b=gKe0rJKsL42EhA9erW1MA11FogDP/VpEsHyzQs2dXpipbhkufmHftIOFC7D31JCBfj
         T9sBRgEThownjH3lXiq7DVyTagUB9bUL+2GQg58bjS1TKPE4zrVirFNBLAfH3CopEBZz
         PVRIgNPmtnfjDho3sQzLSftEFhvQQjPBqDXJIM5JWkcJYr9uDIkeiZ4uSGUtUYVxxmuz
         QtK2RL9f3nUPqJ4N/i+nlx3N8vbJZHGH5VKYwegYvexUOp2PDv9JZNyy0SxnKFsjkW3r
         B7TfOvUal951O+TkmjfwTi4vrEhOii1wx0NHoXq9hJz9XijL3r0CFrAHRUqM+koKEYAd
         Yd1A==
X-Forwarded-Encrypted: i=1; AJvYcCVh92fFzVZlLY6RRGXe4mJuPll5i+NLpldBp9Ar9yuAw+hD6hb/xzi/YSAh/6ElvefxusGW3v03zJIvPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPffCTdWF+bL6wvdRrIH2cYJI51b/Nq7frppGblRI7u0rZJ83c
	xsuCePK3u6JcOmYfQjFACG7GpqSccFmbhemmymDTxaWDnLNnbsd8fNQJeeUKHlUAqyoj8zlTCkD
	n7taE/iKzZ5JQstLho1tp6yt2aHg6CHSPpKAcvcez8oLVPYxidmPmJ9QU+3kbE1kp0Q==
X-Gm-Gg: ATEYQzxlQx0h8e1XFkZs8In6pIvRLoH3NY6gMvAPFSBWJP17QkkJEN1UH4Jj33WXVMy
	VruLgKTKIV9w+dINIl+Qz+Pnio5OcTXTjGr+f0Ae8sYQil9/1paFJAiEisMRQcIRdojg7bKgDd7
	M8gf11LHH1Om9GjQrzdt8h7ffFo2Un9vHSdREjg2noUyY8i7FXRFmWwHQj8wG5llfdG8tAPnW1O
	C5l4BBmehUuQ4EaZLYziLobyt7bouTLB6e0NnGUwzoDsQ7B6sK7YH/rJ0eGxtB2Ri0a8nRJu8zh
	1D4CxeQCmnZTpFgqEMhqM2SuQCKaOyD8ca3UtivsV14O01op3Lnl27F7R4E+HWddU8xMriFl+s2
	z+IDKBJHrfSyfwV9nh4Q/X/ZKEWl5xzxYTD80KsM6TWAtBstVOvV5E/YIvC1r3Foi4EXx3CU7VC
	lniz2oDXShiAxYg1YfbFFZqgSssK8ir3/FkFM=
X-Received: by 2002:a05:6122:4f87:b0:56a:eb30:4e77 with SMTP id 71dfb90a1353d-56b07f721c3mr3178738e0c.19.1772982116335;
        Sun, 08 Mar 2026 08:01:56 -0700 (PDT)
X-Received: by 2002:a05:6122:4f87:b0:56a:eb30:4e77 with SMTP id 71dfb90a1353d-56b07f721c3mr3178693e0c.19.1772982115811;
        Sun, 08 Mar 2026 08:01:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d033ab4sm1503815e87.33.2026.03.08.08.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 08:01:53 -0700 (PDT)
Date: Sun, 8 Mar 2026 17:01:50 +0200
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
Subject: Re: [PATCH 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
Message-ID: <ne3i5tmvperssm4pivae7jhmqzvyy7ftkwnacpaf4ukdqojtha@53mhrxlraw3k>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-3-aa2c330572c0@protonmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308-rimob-new-features-v1-3-aa2c330572c0@protonmail.com>
X-Authority-Analysis: v=2.4 cv=IYSKmGqa c=1 sm=1 tr=0 ts=69ad8f65 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=sfOm8-O8AAAA:8
 a=QiVCaVSgwpAuPVqWOeAA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: PZHFpO5sDcmqecOFknLV47V1OD6anvI7
X-Proofpoint-ORIG-GUID: PZHFpO5sDcmqecOFknLV47V1OD6anvI7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDEzOCBTYWx0ZWRfX4un+WPHlHjdZ
 zqu3VsLaGNSXj2dqeptztZvU84VPHKZimFQKGG6cXDDOJYJyeVZ2CdIc9GKSbcXP9nDk11Z+NdF
 +FUd1+EuJcChEM9piNQEQ/TAQfyZQQHYvfp5D2uz3qbappXV3SC9rXPo+85kXxmQxOFWfetKT1/
 BUk0sRnZNlPw1FsneOhFJZ/j+b+JNs3kMQcnbcKBIekiZ1mvmsuBor0f1AGF61NBIRi981UhiAI
 t7em27OqfQmYz082J4v584ebbXzEDtcT+bm9enaWaiyrHufHGSV5GElFr8cwPYfU+W1Zi+4IqgP
 cqdHWR4N/sGgw/iVDAzkzjzivXP3Uai9+OdyBWQ8cIyQ31bBOD3VNMQm6Kbyga3AkOuzRbdDvZV
 4ZqnXF6aD2239RGdgLGRDzHtCyMgavDXsG3ZBrb9Qq1LAjSnF/P7b34otVhH+a017OGzlxRD1/6
 ixB1Uer/IZxnMI/Rgyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080138

On Sun, Mar 08, 2026 at 04:52:43PM +0100, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Add the description for the display panel found on this phone.
> And with this done we can also enable the GPU and set the zap shader
> firmware path.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 80 ++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&pm8953_s3>;
> +	vddio-supply = <&pm8953_l6>;
> +
> +	pinctrl-0 = <&mdss_default>;
> +	pinctrl-1 = <&mdss_sleep>;
> +	pinctrl-names = "default", "sleep";

It might be better to move pinctrl nodes to the panel device, because
they control the panel reset pin (rather than some kind if DSI-related
pin).

Other than that LGTM.

> +
> +	status = "okay";
> +
> +	panel: panel@0 {
> +		compatible = "novatek,nt35532";
> +		reg = <0>;
> +
> +		backlight = <&pmi8950_wled>;
> +		reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
> +		vsp-supply = <&lab>;
> +		vsn-supply = <&ibb>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +

-- 
With best wishes
Dmitry
