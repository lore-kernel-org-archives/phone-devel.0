Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2662D3264C3
	for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 15:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328945; cv=none; b=cg2N4Has4oZlCDans2ELb+L0smhaL2XVGTOEgKhcW32TkzpC1+TNMiis3FJSZDTYBdpfUearwwfnVbbg5CdNovqj3MaR89UvIkd49/mPp9UUGOE8P0+0s1cYA1khFXCsyZdkOYbFoQRWNQDxvyEcOZ3QFLsAPCHicSrlLt+du30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328945; c=relaxed/simple;
	bh=r+3XPkQ+Rr8XrA4CsycaThkRrYA0ZsU/o5rQm7UAn98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=krD0yLgS+OTLBivi208HYNiCUhNzzjvJF8ccdYcQTiIdC5GL2ZJ4DhhLxRo3stSdR7zTm/BhsTBzUJXLraUT4MpLgW59AnLNS2b6YL/VhOwRnZHwawyx6fUDAL1tYmoVQ+Dqeu4HSQm3aJqTSwh+zw5l7E5sZ4kupG55GJKEs1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V0pDqh3o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QvuwGDgY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V0pDqh3o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QvuwGDgY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CAQn1k4025771
	for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 15:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ou1KDdyWGdC5gksK+DQXqel3
	LdAwTgfZ9t0HMRfNjmo=; b=V0pDqh3oHZa23x/rSPztB5KEirzlwR5mk8PjiIa1
	b8R2qt3Bd/t3WslkEw+ZwOGCH3JVi7S9jZpVKy+LoLkQ+TZDyWRqT7Im1Y7FJYN1
	sMyY+QY/p8YkLiIJe5ehfg4vMWVzMlTaxPbSqYsPG3a9T+1SCFAFFmsNi4gI4PAg
	rc8m7dMygHDlTUwQRqLnUp3NMgfQrO2R75PG2YTRFJXmxPOSUJKJTSp06b6ABUdn
	KLmbn7to7/wBCzxJt5Amfad2a0SgVnuflUNXg6TdeCf1DLF6c8U1ipJu5cn67piG
	sGCgQHwD0b5egvKNJZX25tfXPu4u8dXH1Gy2Te9Yr4M8sw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh50th9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 15:22:23 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94deb62ae32so12167389241.2
        for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 08:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773328942; x=1773933742; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ou1KDdyWGdC5gksK+DQXqel3LdAwTgfZ9t0HMRfNjmo=;
        b=QvuwGDgYoNGXhSICW//9C3ms5AjidFc4L46H69BD6G7iSt23NTm1kpfdNh0HEj7rLA
         Cd7J2VvagoN5BgF9U72s/aaMMANtiihiYICEuhx9/9qrCFhu0nK6laFC13nmbO4Mgmx1
         CFAe5FuyK63Eg2ivOw5yTtpsSj2rfSp92WvqQeOehAaArajENGX/pZO/KHx6iV46nz8c
         Sbgu6NFS5aQPx0ZueW59pW30hkye4+ZuITIRpjJK4KYNE98w4vyIGukDtvbTGEZsP024
         pUpwi/iJf+RaJDBC9m9pj195jlV+BErWnuPZdW9wNHj/yI/ZIk4Qy9iGhr7Wg7Hcu8ia
         tDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773328942; x=1773933742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ou1KDdyWGdC5gksK+DQXqel3LdAwTgfZ9t0HMRfNjmo=;
        b=iB5Y2KAdTKbKFbbqSBs3XN6X7a7zAGzSkEDhvGpzdb5J1DNrILMi1UIlXPTo5Qon6W
         dXMF1FKGKuu1YA31dkVfUYlsn4d0CoChFW6GTu82mWsexfoand4UDP2RFe4AKM9Ipfbx
         coP1LDr7uDwtjPu+aWGFKDnZwOwJMbgyuxq2Hnp5eUq2hd+Cl/XGw+EuSVsFOZ/QtLRQ
         033wquvJR9619xH4yjIT3VHP0NrH49CL11JSz/pS820IkolEV0jL7+xeO3a0PwrSqoY+
         dz6Morw6lgjGCQ7gL+0CJb4gKy65pUQopaGvOLRNdiR/LtAxzPaotSn4u6yZF8o8KJeO
         fDqg==
X-Forwarded-Encrypted: i=1; AJvYcCVxjCBF+PJ/FRHcIoAS0ID33iA9fPU09XhN6nWFspsQZ7hp88TSgIIG7HFbrFbX52xW9rlp45VnxSCedA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbHzynHlbnPllVMrGyDISFoLBu8vrM7mTZuaN6VLXmabE+poaN
	A/+V+hQi8uag3HkTPDUyWOsS+XN96QGtogdUHTSfF7JCjVFHHuP+ZrG3P3wYoaml2eOdnOMNjm2
	Cn7W0irhmzezHhoyRMXc26VSzcB9S/m0XBW6iYC/6m1zcLGynorWTgsC4dd6nsXtR5A==
X-Gm-Gg: ATEYQzxgzgZKq75HfR6JEEzJ+/VHRWZdOXl1Ur56MAgxzSB2FQhPrUX8q+KHF2CAOCu
	jT/l9vhn7bhaveNeFQG1Cd5U1GxSYpZaLNNJiH4uOBmLan2UBKJkg6B/VMNvMCkSLmLhO0KsELD
	G0rb+1U4jbzGJKGQGCqMs3jYd/uBAT3hWxluK4z4HukmYHc5B/sB3g84ZqRuO2CV/l84TFh6K8c
	BsK09CLzfJNzjT11lNIzeEiTvpqZTIHSoD+B2allPgNEOqtjy0/XChInBPwuEUl7BZ3FXlPAPUF
	Sb5lUzLwI4uCHyVNfIMY/nEUMY7Mu52bkSJwMxuep7j1YQV8H/r1B2DYUtIOGNycgdWlGRaea93
	qf27XotMXTETAkHZ99JFmo9Qz0P3p7ErmmOde5HAFb0S3K3UlfnQ2e+Hs6XseV8aZWSx2PYcgqC
	q8qkobhwefv2FpejoUWqjxJtmr0IdN3rj9gS8=
X-Received: by 2002:a05:6102:3e93:b0:5f7:2430:cba with SMTP id ada2fe7eead31-601debf6c48mr2796517137.12.1773328942324;
        Thu, 12 Mar 2026 08:22:22 -0700 (PDT)
X-Received: by 2002:a05:6102:3e93:b0:5f7:2430:cba with SMTP id ada2fe7eead31-601debf6c48mr2796485137.12.1773328941862;
        Thu, 12 Mar 2026 08:22:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156358066sm1018277e87.63.2026.03.12.08.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:22:20 -0700 (PDT)
Date: Thu, 12 Mar 2026 17:22:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci <cristian_ci@protonmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
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
Message-ID: <4t7czdplolfhjfccjvildyerd4mj2rildse2tyasz6mclwe3iu@f3qyq2xqm2vu>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-3-aa2c330572c0@protonmail.com>
 <ne3i5tmvperssm4pivae7jhmqzvyy7ftkwnacpaf4ukdqojtha@53mhrxlraw3k>
 <f309905e-6f7f-440e-b463-7bda54298164@oss.qualcomm.com>
 <BP1Sd6YH7pfwUcIQzlAHRokbTdR0TiORnTMO27J1CcPV_O1R1HO85gyIJf_J1szOiMAXn2taMlmC2iUt0Cpr4jKjB7wTeukWuIBFzj5eBdU=@protonmail.com>
 <e6m5xhnexza6fnmz6cczwsrp3ec6n643yjukj64gvync627sl3@2pldnf7ldcpi>
 <TVEaCiufQE0XjfNRlD6DUS6UjDw6nPyHh6ENYRSpFQT0ZD_o5sBH_Albc17WmU0B06PyfSq7elJ0c9C68kjDSgzBHcwYaOPl79XnKBPIU8M=@protonmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TVEaCiufQE0XjfNRlD6DUS6UjDw6nPyHh6ENYRSpFQT0ZD_o5sBH_Albc17WmU0B06PyfSq7elJ0c9C68kjDSgzBHcwYaOPl79XnKBPIU8M=@protonmail.com>
X-Proofpoint-GUID: PoLPNNFuCqivcF3Y9qQtVa39pboiHwzn
X-Authority-Analysis: v=2.4 cv=LvKfC3dc c=1 sm=1 tr=0 ts=69b2da2f cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=sfOm8-O8AAAA:8 a=idwq_kbngesG2L6DWakA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: PoLPNNFuCqivcF3Y9qQtVa39pboiHwzn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEyMSBTYWx0ZWRfX71Is18Dzkvkf
 RKCu2ZfZz01CfmqAM8ZtOcaxMxIH5kHSEH8c+GCwTYilDV9enY2t0E29+x3GoLdCjs5+eejmxiN
 6XgR6dl0yqx6Hxon8H1TY03yR2mHNh79fbla//sj03NfWcBhGbdckNa+YFJA3oejQ0DuORGpt4r
 G3bcIcys3PgvPgEj+vb9DuzkjkLw2x0n4gUrZWNHNdnrBCBnE01SkQiNznEzIr5whU/80a5tK1I
 aC8SHHgB9C5ybMMAnOS4h+mh9ISPSiDJKl/7qVcXPjTcGh2YZTKN/G+A8nPYHp4NXFpSSi0XX0v
 Au9yfyrCap7yLYSaHvT87/YU92NKmkJfrchaiE433UvAcIDsC0YeC9X1MgU3NyJDYVFTehArKbw
 WFBeaWPV37hfBFagK4dnllTdYyIbYubPv/ATl5QGI6Zt/BN53pvX/j+DsJXfSIrdsXDqDMzweaA
 f9Fml3ubE6BYcCQdTUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120121

On Thu, Mar 12, 2026 at 07:58:04AM +0000, cristian_ci wrote:
> 
> On Tuesday, March 10th, 2026 at 23:30, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> > On Tue, Mar 10, 2026 at 04:42:43PM +0000, cristian_ci wrote:
> > > On Tuesday, March 10th, 2026 at 12:28, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> > >
> > > > On 3/8/26 4:01 PM, Dmitry Baryshkov wrote:
> > > > > On Sun, Mar 08, 2026 at 04:52:43PM +0100, Cristian Cozzolino via B4 Relay wrote:
> > > > >> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> > > > >>
> > > > >> Add the description for the display panel found on this phone.
> > > > >> And with this done we can also enable the GPU and set the zap shader
> > > > >> firmware path.
> > > > >>
> > > > >> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > > > >> ---
> > > > >>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 80 ++++++++++++++++++++++
> > > > >>  1 file changed, 80 insertions(+)
> > > > >>
> > > > >> +
> > > > >> +&mdss_dsi0 {
> > > > >> +	vdda-supply = <&pm8953_s3>;
> > > > >> +	vddio-supply = <&pm8953_l6>;
> > > > >> +
> > > > >> +	pinctrl-0 = <&mdss_default>;
> > > > >> +	pinctrl-1 = <&mdss_sleep>;
> > > > >> +	pinctrl-names = "default", "sleep";
> > > > >
> > > > > It might be better to move pinctrl nodes to the panel device, because
> > > > > they control the panel reset pin (rather than some kind if DSI-related
> > > > > pin).
> > > >
> > > > +1, perhaps let's rename that pin to panel_reset while at it
> > >
> > > So, something like (plus related renaming in tlmm node):
> > >
> > > 	panel: panel@0 {
> > > 		compatible = "novatek,nt35532";
> > > 		reg = <0>;
> > >
> > > 		backlight = <&pmi8950_wled>;
> > > 		reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
> > > 		vsp-supply = <&lab>;
> > > 		vsn-supply = <&ibb>;
> > >
> > > 		pinctrl-0 = <&panel_default>;
> > > 		pinctrl-1 = <&panel_reset>;
> > > 		pinctrl-names = "default", "reset";
> > 
> > No, "reset" would not be recognized. Use "sleep" as before.
> 
> so, something like:
> 
>  		pinctrl-1 = <&panel_sleep>;
>  		pinctrl-names = "default", "sleep";
> 
> ?
> 
> Also, should I remove 'sleep' state if panel handles only one state ('default')
> instead of two states (like mdss)?

Yes, DSI panels don't have (and don't use) a separate sleep pinctrl
state.

> 
> > >
> > > 		port {
> > > 			panel_in: endpoint {
> > > 				remote-endpoint = <&mdss_dsi0_out>;
> > > 			};
> > > 		};
> > > 	};
> > >
> > > this?
> > >
> > > > Konrad
> > > >
> > >
> > > Regards
> > 
> > --
> > With best wishes
> > Dmitry
> >

-- 
With best wishes
Dmitry
