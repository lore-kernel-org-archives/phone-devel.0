Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49AF3AB27A
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 22:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773181814; cv=none; b=o7TIkD5kDIvMkntoqUdo8wElNuOlDkeYZkQuLPK+kT8w4a56VEiYXJGuUVt8VuM33ghqftJL5/wvYIo4mCJDPWs7d5b9MXgf2GNaAYxr4gQW6+4rJjtnxrDLTCIQP/mfS+GKYbd/RemMWE8lyAfDXgQ01XzJ60rAvcwxK7VGgVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773181814; c=relaxed/simple;
	bh=E+MzsQ/XNb5YDD8Kdpz85uaBf83jdRYE/spDSsi/7S8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ujx98mKAK1Gyf5yds/TjPK9/8/yNMOUuGllynjESV6qv/soTs+A67U/lvvIBT+0PVI/9ZxKtvXOKvHe14ycVIWNbxxOlEtGHSWt8ss0FHmKtg3oKE1ehbO+SQbHWQwsHf+yCd0vmLb8eyuo5JDDYfU7yCSfArxpODZOuqmGKLw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YAL6wTjo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T0OKDDfM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YAL6wTjo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T0OKDDfM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AGAfw41265813
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 22:30:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qxVdbmYtQiHkpJysUmcujS2L
	t7a1GevGxB0GGYw6iIk=; b=YAL6wTjoxJVvY5pZxsjYm42FCvyIvWImTyIkPgOL
	33sUiwqcons5/Ad528nBUbny8vmSWCntELSotWgMOgXyzChTm5VX69SpQjOlGRxw
	PJ/9tlOoGgk4qehz6lPy+8Lqe/vWSraC0qgKmJAh+Dnuww+S+TanpI6wNYogfDdI
	VMEwgyONIY/VB8pMhXV0QOVTjtDNmaFwOukIcPb2cIKKVrnIiMuyfkzKRO3jSHOa
	9aLnCLfBDwklkSINYtFfSf2gCSL4VToHDYkaw5Lzdncdp2//0W0RuWRSxbDdGOuW
	IeDSoBq71cr9wDEdlFV8i+iiGzr6ENnXqFIrv3Savivvdg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctpkfhcn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 22:30:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd81c571a5so1505606685a.0
        for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 15:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773181811; x=1773786611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qxVdbmYtQiHkpJysUmcujS2Lt7a1GevGxB0GGYw6iIk=;
        b=T0OKDDfMw2SNeQgT6dkfRj4ayl1yEsqbB8iZxXUFG00bnTsgybAUtNop+TlduvJgnt
         f2hVyYyJyGHgY0+b2SEwAC0/1EEA2QnDqSqgeCUUraVFGScpMcm/srb8Z3h2nuLu9qet
         LHWfB4qvl9jkoB4tAtGPKyzYXoH1QRNQwpUMBGP6z8OBGOcSZTjvwE/SHadEbstCEC38
         qMYaBnpQbYbzPpdUYAVsFqDkwS/enBOziC+NuLPrNuqWJGxr3F/4fEH1iEL5ih4W93zK
         CM1gzeJJrTFxbMj4PwtXFpvh3ra1mnz8Fv3UQic2cLcxyyO9DENT8zH7Kw9M98ivNyUn
         Eltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773181811; x=1773786611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxVdbmYtQiHkpJysUmcujS2Lt7a1GevGxB0GGYw6iIk=;
        b=qlwYHEP+p3yYm4S4ae8VJ0UeomHZeO6HEB8Xrpzo633i86dAVK+F/vHMp79YpnBqpJ
         wujKlWNDTso6530eRg1bpgzEezwD71AuGF9Ffvm76uBK/uqwBWEnerY8M+U2VMaPTjwn
         AsDkqiScpRcdsSqy2LDVe1ba2aNdXcHm+9uw5broTHN92BbQa4d2NA2vdnvutDwN0Pfy
         95sHPi8elh90WSgFqZaer1Tycn+YmBE6SKWJcRPWpGgYxxnXl70zH9lBJD04zF4q5O81
         Lc6TZr0puiXDwFgXd50V22ohsE83INseCj8uM0rqOm20WHMskugGefnzpQ8fAzzm8pMg
         IJBw==
X-Forwarded-Encrypted: i=1; AJvYcCVSzEDDrnmirP37wkZsVUhGNsipZ3w44pngoV9SC/UHJJw6jFIZJqtNTDZpp8YTokMFzkfDcxSxeAAAzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJXPyzq7Dli5E4Jij7itPFxCHMLX6Ai+SNWoyhbi8aZtSogOsh
	u/Cin4G9Rg3SGTY3VkW9NIH1C8RClbFc8jltA3nyXxMVwtvrOg/fpzUjU5SM0C6keWVtlpguEbC
	w/2OE3hgiuWDaQeT2AaKsLjaPnsIIDXdB9vUXKut5c2ueXRLCNhi7AgI8waFUDMWlRg==
X-Gm-Gg: ATEYQzyF0YPOYLhzQedPSF0rhs71siYwsExAZKigdgBF0tV7rplgZVFAJQ6T0P5daHa
	atlexTwANpP0fQN7ZSnUkC1KsgEe92XkAH4MIgqZuc7i11Gh6XBZtd35dHCL1Q8mvMP9BEjGowe
	0IXySm9xpFOis1MmXu7WdwXwJgSSGk/lUpFLramXChFp3XLLGSkXewAGnYKstjVMUfvAUfcSrcY
	Sw7r+ORp9SG0ISoFx5YXN58qWB5XQel0PMj7EMjNY7rhQAl9gjK02CQhWGRTh7ImjOkwT0h/ULb
	568x2qWuL/OALiG4ijT5bVY9iGcKJCBNn/OWtq6fzPum2a7f8m04I2Ue1qiY9FTJlYo6zHc5RqQ
	gVurfMwnilb5SzMiUxC6AsMxrOtJwcvv/6wniTXF8gmipQxI4RimqsXqVhtJQGclOrmCVZjO+6R
	sCoh3+rhznH7mTPW7V6VxyCPT05ffx7BStBLM=
X-Received: by 2002:a05:620a:44c4:b0:8cb:4fe7:4c8b with SMTP id af79cd13be357-8cda1a5714dmr74180785a.62.1773181810680;
        Tue, 10 Mar 2026 15:30:10 -0700 (PDT)
X-Received: by 2002:a05:620a:44c4:b0:8cb:4fe7:4c8b with SMTP id af79cd13be357-8cda1a5714dmr74172585a.62.1773181810106;
        Tue, 10 Mar 2026 15:30:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e646sm74637e87.31.2026.03.10.15.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 15:30:08 -0700 (PDT)
Date: Wed, 11 Mar 2026 00:30:05 +0200
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
Message-ID: <e6m5xhnexza6fnmz6cczwsrp3ec6n643yjukj64gvync627sl3@2pldnf7ldcpi>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-3-aa2c330572c0@protonmail.com>
 <ne3i5tmvperssm4pivae7jhmqzvyy7ftkwnacpaf4ukdqojtha@53mhrxlraw3k>
 <f309905e-6f7f-440e-b463-7bda54298164@oss.qualcomm.com>
 <BP1Sd6YH7pfwUcIQzlAHRokbTdR0TiORnTMO27J1CcPV_O1R1HO85gyIJf_J1szOiMAXn2taMlmC2iUt0Cpr4jKjB7wTeukWuIBFzj5eBdU=@protonmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BP1Sd6YH7pfwUcIQzlAHRokbTdR0TiORnTMO27J1CcPV_O1R1HO85gyIJf_J1szOiMAXn2taMlmC2iUt0Cpr4jKjB7wTeukWuIBFzj5eBdU=@protonmail.com>
X-Proofpoint-GUID: N6GB_rpK698P4_3iQVq4S7LPpY1iZ30L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE5MiBTYWx0ZWRfX1ue1IyzS1vmG
 PIT+TUmdS8TTNkAQ74vYz8/90Dm9gbtgyvq1SyzruVYxw0qGCHACKFQuVWGuBqIWBOW1Vur203U
 zykyYEKvxPKrwUdoIRNjlNpZygUbVNyUYZTIn1cPZFSka98oFNa+EYgqbqWpKwPVYe3aWGDYaT4
 tHeMz7/W9/BlLkUNgFsU1d15T0XDS84+P4KYcQpQ6DzjYiQgpaakB5J3EflYFYUyWiTlPYCQGdW
 /VXeFi4Yu7kpSi4UPc6ZbJjqEQUTM9Zx0lfewy9CUMHZVVupXIAAJLPMwHam+Oyi79DFeWjW/dD
 GaJ1F7rK22PXiENQ0VrzmVVQm1g51xqAEESP402zgLAGJ01YNZM1nnb3HlRH7P/1qjQWKfcM2L8
 U0x4BoEaxuPxGgra10ldkkh+VaJwGLIxK9OCThXjyUqUlT3f+MS0oie73EsGN1LU+1Rsh2EeL2Z
 t/tZlYiaTooj8kMVuEA==
X-Proofpoint-ORIG-GUID: N6GB_rpK698P4_3iQVq4S7LPpY1iZ30L
X-Authority-Analysis: v=2.4 cv=Gq5PO01C c=1 sm=1 tr=0 ts=69b09b74 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=sfOm8-O8AAAA:8 a=XOktAL3nDL9lPePKX28A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100192

On Tue, Mar 10, 2026 at 04:42:43PM +0000, cristian_ci wrote:
> On Tuesday, March 10th, 2026 at 12:28, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
> > On 3/8/26 4:01 PM, Dmitry Baryshkov wrote:
> > > On Sun, Mar 08, 2026 at 04:52:43PM +0100, Cristian Cozzolino via B4 Relay wrote:
> > >> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> > >>
> > >> Add the description for the display panel found on this phone.
> > >> And with this done we can also enable the GPU and set the zap shader
> > >> firmware path.
> > >>
> > >> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > >> ---
> > >>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 80 ++++++++++++++++++++++
> > >>  1 file changed, 80 insertions(+)
> > >>
> > >> +
> > >> +&mdss_dsi0 {
> > >> +	vdda-supply = <&pm8953_s3>;
> > >> +	vddio-supply = <&pm8953_l6>;
> > >> +
> > >> +	pinctrl-0 = <&mdss_default>;
> > >> +	pinctrl-1 = <&mdss_sleep>;
> > >> +	pinctrl-names = "default", "sleep";
> > >
> > > It might be better to move pinctrl nodes to the panel device, because
> > > they control the panel reset pin (rather than some kind if DSI-related
> > > pin).
> > 
> > +1, perhaps let's rename that pin to panel_reset while at it
> 
> So, something like (plus related renaming in tlmm node):
> 
> 	panel: panel@0 {
> 		compatible = "novatek,nt35532";
> 		reg = <0>;
> 
> 		backlight = <&pmi8950_wled>;
> 		reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
> 		vsp-supply = <&lab>;
> 		vsn-supply = <&ibb>;
> 
> 		pinctrl-0 = <&panel_default>;
> 		pinctrl-1 = <&panel_reset>;
> 		pinctrl-names = "default", "reset";

No, "reset" would not be recognized. Use "sleep" as before.

> 
> 		port {
> 			panel_in: endpoint {
> 				remote-endpoint = <&mdss_dsi0_out>;
> 			};
> 		};
> 	};
>  
> this?
> 
> > Konrad
> > 
> 
> Regards

-- 
With best wishes
Dmitry
