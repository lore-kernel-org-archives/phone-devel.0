Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344B73164DF
	for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 14:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770993121; cv=none; b=rPP06DQu8BrKOk/T00mn64HcA3ZW6NOkki+3K0466+8K7+DfCPD5HlmCX90iHM44jO0kqdeAoYTm03Kfd7cHdQDRYCt66JDbK/lXwPvsSAlxiY0Ct4k1A5FZYpRt2Kq5HQweQyn0yA9REsbtpVpbvcnkVA/Cffb+QWme6mzZ/fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770993121; c=relaxed/simple;
	bh=1vEdkt+tbR0py8CfZPlFWQtfgVIPPJHiU4DSlQi9TCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZkE5c4wDaIsGwNimdHPaMQZg+++E6L9o0/sDeDVI3mVAaTHCGst5OGiaCo60gZafoOi46AA18FAya/XBmlCpsy10PgH9CYvivJ6mv311tTxl8P+M34M6+hYB6wgV9dztUGB2vgZBe755Bc45aC9CfJrt82SWv/xZmQVKPByfS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VmtYwDdx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSnNJF+e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VmtYwDdx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kSnNJF+e"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DAQJgO2095055
	for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 14:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dFLCe8eFiVo63xoYgYgA5byO
	eLUsJUazufgIwZ8xBX4=; b=VmtYwDdxgc+gQ95ktyJ1U37EfNNFHY5x/27+ZoKs
	FWB/IMOI8o26+JEL/TenWtabyv/cS03pWu2olTwI3esuPxD3Y5wTKauxL439Vz+T
	QhCSkA5hB+aMEgLQLqMJhY4Iwa/jrIVSUwqatSeGTSZLD21Nc5590LYPrZ4EZ8Jk
	KUImk8FORfprrRMwoEpHlupwGcyY5txFM5dsamxDSz0zsunQTktKld7iJN12SyjY
	gF8Ref1OJM9Q/xBC/Vfr3nx2MIVT2SXwrOLfmSDCo+7F9iokCOJ7qngZ3zXtWSd1
	coNKeIctrKwwW9S8gnwltVImHJmyaWH/rAzPUUnLw/Uo+Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9k6y40ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 14:31:59 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94ad0ada369so1438331241.0
        for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 06:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770993118; x=1771597918; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dFLCe8eFiVo63xoYgYgA5byOeLUsJUazufgIwZ8xBX4=;
        b=kSnNJF+eT9/DFxa0D+JhqT+n/QgZ8zsPRdkZJPZntOu/RYfwDUambRgDOnrwQJhZlm
         GoJpuRuVRAQw7ZNTbSrUDdjlc43gbR42dvbc/mx/qymyPK/xYnhu+yYa3CWAuw9k98sr
         S+wZWY7/BxzBDthVxCIjXpWX08FPu89/sDOhbxbD3nnUjHjrxxcUkGhkuVQmpBzoLLSy
         QqCJKiT7ldOO4e4VYshroxVfcQoR+fezFdaXK8OL7D3WQDpS7DSPGvqtKbBdwHx9L1ef
         U1QUhipyWQn+Rufd1c5Bc8/jrprHSHFsi3C6gsW/ETVudvqTYq8lU67E2eRmfpidtJmn
         jrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770993118; x=1771597918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFLCe8eFiVo63xoYgYgA5byOeLUsJUazufgIwZ8xBX4=;
        b=Q6SNKJ3FshsmGwwoGmJ7N7FzEVfQYKRxyc4LxqzcRR+v2UE3oSu1W4lOZer7UW1cdH
         Ssub6QAbqaX63V3QzVyx9RXAFQn9sMTbQ/SW/ZtlV9W3p5bou/ccuOMHqaCqIpGyNfxT
         5KrWGPz5SII2h3902uoz6Ubf+sDtEfF3qBE/+D85oTZeYZibDgHguxpCB3x0FRaX984H
         xOim3M2VqcDSHSdBC6IXtqLjCMoTOo0LwHMv5Cf1jFSlW6/C5Zz0niRQzcAo8zspqMXL
         xEvhrlAyOI+vDVY7QcD0ury0BX9Ou/hjNJGLDo6DtgT9o7fTtXzqLDsNNBuw/NvCTpw2
         gieQ==
X-Forwarded-Encrypted: i=1; AJvYcCVON1nCshqFI3RpE0FLpGdCSYK668CPdylTvKc2sjELsXiHHcc9NtkAg2xX4sFqBsO12wkXq0zro3OCwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQoBBT+5w0B5jdwRyPWC+G0l8PM6yzsWkYx12Abo4P+trW1Kx1
	N/i9NK+7JrzDH1jiSwiE4GGT/tPG2kUXgHgu5HT6dtJNuiwqVBDsTSc06rTjX2aIARQP4Kj2GOZ
	PkAeIUBrrHoqBevzFKqp9H/j7RrsJVUS5wQlIjl0JBfHnoB6aNvAc9cNGxHERgnlie/hs/CulGA
	==
X-Gm-Gg: AZuq6aKm6Dg4/RaqyT78VVTZ18jRlguLmGk0YE+Bip6NLUu7YV5Lna9Ppy8Ev3ssVLd
	RQ+FL5eRJ7Se1DzeFwFiHWIiFU12zEALjEOUsJ1L9SFSn9WtFOPEyXoF9v+6i+lQIC4FNd90iGF
	OyFXDBVE4U0jutYNZlS/eDTzYpgus7CUYtsobFYJDP095NWq2+NXRBMvDXWASK9V00YcXzuJtoW
	d7bn+30iBzL7iYjJqMTeiufRl5Ng1Msautyur1dc0SqatSxw+RIw+6vKwkekUXom0VreEwJ8MSO
	FWBh/9U9OY9M/9tzSiYA9pcXF95NaWJJ/afQJlclG9ttoueNoeQrNXSWo9IWkP7xG2Mz1ty0gIy
	VXarKbpmYJn3VdISPqFxQuMVV5TiKmyDDPdBxn+korcFJ+gIIif+ahkLrMf2zCQRGRrC0MbOg8z
	WSndlQaoNPG6DSRST5zSglMtSEmIBLfbYKz+8=
X-Received: by 2002:a05:6102:41a5:b0:5fd:7140:e38b with SMTP id ada2fe7eead31-5fe16f5890dmr863055137.35.1770993117984;
        Fri, 13 Feb 2026 06:31:57 -0800 (PST)
X-Received: by 2002:a05:6102:41a5:b0:5fd:7140:e38b with SMTP id ada2fe7eead31-5fe16f5890dmr862998137.35.1770993117472;
        Fri, 13 Feb 2026 06:31:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f568d95sm1587292e87.30.2026.02.13.06.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 06:31:56 -0800 (PST)
Date: Fri, 13 Feb 2026 16:31:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: milos: Add WCN6750 WiFi node
Message-ID: <4u6yutdbpmsaz5t2rzjtttvvbf5onkckkdwxqma672pqnkre5w@zagnzqwl7ju5>
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-3-27b4fbb77e9c@fairphone.com>
 <5fe80f4a-ef5c-4008-88e2-60ad1f8c2a18@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fe80f4a-ef5c-4008-88e2-60ad1f8c2a18@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NsTcssdJ c=1 sm=1 tr=0 ts=698f35df cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=6H0WHjuAAAAA:8
 a=COk6AnOGAAAA:8 a=ivZSRQ1sCz6FCfny6LkA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=Soq9LBFxuPC4vsCAQt-j:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDExMCBTYWx0ZWRfX1o2wjoB2Ehop
 eOhFdlOKyZcNS5R3fSw/mOx7Gik+PbBXq7sDsirwZkTHzs7vPyWJxHgupswTD+zmcrkpV+BDlwK
 jVMn/6hwgDTafuyqwV56/eU19bVzWxtiPVr1SNuuRW2FAccPexklbH617jHciFg5s3DYW02QD1w
 m1//CvJJL1LU8ChzjgehFBABVUnnXjmdFC4bZkgbf81svubmm94gIIv9lEKBgOY87Ji4rjfhnQU
 aHy5Rx1OAtmtvu5SfZHzygiQ4zz38/jVyogL7mN78JojqIHvs96bcXv3KrUFC9H+iMeOr4R7uM4
 r+dTMfLyhkTxQWjlUv0pu66j04iJcbhfVA5S++Q0oW3FLSZhYckbDtFOBNEAWgRsLLrBy+sJIso
 RQVtn2zqFIKlK1wlgHbTROS0aVWf6omosfhtO5xxqU5c6bUxIOqLnP2xclkRelL+BndIC8V+ySs
 vCh90eFHHnpbSFPNS2A==
X-Proofpoint-GUID: jdEySbPrntn1oSpRN24qQwqcdxnylwk7
X-Proofpoint-ORIG-GUID: jdEySbPrntn1oSpRN24qQwqcdxnylwk7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130110

On Tue, Jan 20, 2026 at 03:39:44PM +0100, Konrad Dybcio wrote:
> On 1/16/26 3:50 PM, Luca Weiss wrote:
> > Add a node for the WCN6750 WiFi found with the Milos SoC.
> > 
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  arch/arm64/boot/dts/qcom/milos.dtsi | 46 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> > index 024e1c9992fe..80feb3e9d3e2 100644
> > --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> > @@ -2043,6 +2043,52 @@ gic_its: msi-controller@17140000 {
> >  			};
> >  		};
> >  
> > +		wifi: wifi@17110040 {
> > +			compatible = "qcom,wcn6750-wifi";
> > +			reg = <0x0 0x17110040 0x0 0x0>;
> 
> This reg doesn't.. sound.. very.. good..
> 
> The size being 0 is of course wrong, but perhaps more interestingly
> the base address is a register within the GIC..
> 
> > +			iommus = <&apps_smmu 0x1400 0x1>;
> 
> And this is a PCIe stream
> 
> But I see kodiak has the exact same setup..
> 
> After digging a little into the driver, that 'reg' is apparently
> indeed consumed, as a base for PCI MSIs.. I feel like there should be
> some better way to express this.. non-everyday setup

I wonder, why are we using it directly instead of relying on GIC? I
guess it is because we need to map MSI registers over the PCIe IOMMU and
then let the other side write to them. How is it being handled in the
normal PCIe case?

> 
> There's this commit message:
> 
> commit 00fd24089b8154ddf5b3e724e2c4c9974b9ba91e
> Author: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Date:   Fri Apr 29 22:34:54 2022 +0530
> 
>     dt: bindings: net: add bindings of WCN6750 for ath11k
>     
>     WCN6750 is the WLAN chip on Qualcomm Snapdragon SoC SC7280;
>     Though being a PCIe based solution, it is not attached to
>     the APSS processor (Application Processor SubSystem), it is
>     instead attached to another tiny processor called WPSS Q6
>     processor (Wireless Processor SubSystem) on the SC7280 MSM,
>     where the WLAN firmware runs, and it is the WLAN firmware
>     running on the Q6 processor which enumerates WCN6750, as a
>     result APPS processor would never know such a device being
>     present in the system and would not detect the WCN6750
>     hardware unless and otherwise WCN6750 is registered as a
>     platform device. This is the reason behind adding WCN6750
>     WLAN node in the device tree.
>     
>     Add WCN6750 wireless driver support, its based on ath11k driver.
> 
> Sorry to hijack this patch, but I am not comfortable with this binding
> as-is..
> 
> Adding +Jeff in case he has any thoughts
> 
> Konrad

-- 
With best wishes
Dmitry
