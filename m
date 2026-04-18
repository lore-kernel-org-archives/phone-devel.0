Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90EA30649C
	for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 16:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776530678; cv=none; b=szAEd+pNU22j3GMe7QtYHJmmP1bBARKXIJEyhPRhfiHPQ1UZPmb+ufteGkTI3PafFpy6thgI6T815BYtQYzTWQ0xWAvGdEIqDP7hkIvI8Osv1Q7RdUM+0QT/BDTLKIGJGCgU4H14eoamn5OtBvI8/jScMacIlGcdm0ET09Ukfps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776530678; c=relaxed/simple;
	bh=+yeTblmkeEqbMbcol7DIP0ADtn1Jj7eFtxRnDh46Sxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDmKDioKu2YBQ4M/oht6Ob0vMHYeoeipPppOPSyCBNTz4kEjguEV0WRJAFMt43ziBmPHR14iBHaLMSq3EVLJof691YDzrl7ECebVRHZEtSIYQ1Dw76kjyxTQPxvebucjMNDXj1tQI0sRcLSVyPK8Z1YS6WO7cC+mD1HHv/2j00o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l58PhoJm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MyKq4V+5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l58PhoJm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MyKq4V+5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63IArJfW258974
	for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 16:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ERRJslALpdPUtIIjpQTnGQLh
	UXAbQPp4BDvuWfJJu/8=; b=l58PhoJmP6rvlWivCaL9jLWPLaIsMt9TY38qHd74
	pnsVImct8mqbhHGHEnr+tm1zYdfTD6U6Z/9Ea8Q+ttXD/5Xtb2u8cNdbO3Rf/8Gu
	JH7+Mn00WUQbuIrbwlOcBDrukswHbsHRr0bwpkoua9ln06YJdipYcAYKske5g+gu
	AF6DjrMOdfVmIWgDE9z7fbV6ttf66ECJAbS/Jgc8fkdiLSdclapl7MmURzEjxrta
	AqdiYNcDFyDadLszl0DlC/659V7Ju/Y10OymtUffdXiOB42DSV1ElpadvQGXIVL2
	vX1A10cFLxygublwP5tgxaAnYJ8aWmQdG6kizfmnXPLBCg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm261s5rf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 16:44:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e136aff17so33261881cf.3
        for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 09:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776530675; x=1777135475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ERRJslALpdPUtIIjpQTnGQLhUXAbQPp4BDvuWfJJu/8=;
        b=MyKq4V+5gSP2qxdelnB0Zeetbcv7o95RxYjK5KTY0IBUDxJuSphsk3xc/ZqD1QkmHX
         zRms8NJeEzAEdSPZi7CSnamEGtHnxPWUIzteBycR9cv9683XIFdEPIGpeIhr/8Xh089k
         jZFafWyD5WtoSp7XEd90YySsXlwaky+pTUNbMMyNIheVbEj3sM5GT6P9wyRdeRDWEdN5
         GuNdL15CGetRgISOoqxBrMV2xLoltUyFY+ijJuSgdZzQBnq6hD+9azMOzyp8I81kPhXm
         6J2sUwjO+zThh4ySk2e5AW1/1XY6ZLDkDuH+2rQ8/SXsugEquG0C2JWI44vYpiyev4Kh
         JzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776530675; x=1777135475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ERRJslALpdPUtIIjpQTnGQLhUXAbQPp4BDvuWfJJu/8=;
        b=bMyyHV6e0JRDFqbVmXrIoFRq+ubKsQmfeEQyTDNMajVIvBs4dd1aLTmguDyGxAhwia
         LSLP6ENiBq4d77zUzfAn1gpJuH3jRub0U/DGlYq4gMNxaYnpHvnWtaeQrToAU/c3Ai3z
         0p4eXFbtaZM7enRyIXPJeW6wyIdp/X8d0MQ/Plj9Z+tI3KKSZrzz/yI9fLgpob0JzgGp
         EWGEyaGKJ5bGUxRRwJMSWjy+FMaHcDGqdZ3iuRRR4CU+/M74f/DIjxlnFq1dVopTHr1C
         mPQveYTVzpQMqK/mSO5FaNgWpxG8OE3aOcsSO30v06fsXzNAkzAWfd2BAY2bsfPdURRc
         h0rw==
X-Forwarded-Encrypted: i=1; AFNElJ+BrI9IW88qeXRwnE+6kry3UIZKTzODXUbTklugaBSZMYIxqyehxbCRZW0Vx7RL6i63nYJo+Kw3ox/jpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMKRx8OLoVrofmBEFO/6YC2MCuMWw5nP/4i6wqCM8nF6zxXq3i
	aioCZ4Lo+jErIiQJx7HlGgxh8l9PZ4CIqgDioI7zMz5OMV974ptVC4GHUD7gBj9jWYL5IldfBVT
	/z0WhMPt+S6q65c7txAOWL0KvsEDy7vX9VTszpwkx6KUvKwPUPJmnNgsU09YbhSwxXQ==
X-Gm-Gg: AeBDietxxcTWmvXsuLUTrtxgkninbWxI3XT6kFk2FZsmnDvN9V8kX934ITSu3Omy5Zl
	iKGxQBtz+ZeDqT7wWW3pKYDcNf4jmzSRQV0Kd1wrQLKob73B+5APGNs9/YCRuTiSsCm7c6FIh+N
	irDZ08StnHluzLvOVZaS8KidRIhP8kY91F5CUMGol6Nx5sfsFcpBw1S533KadfV3AbJasczBZ21
	fYVh3V70aytZ6hCtdmknYTPMY+ZovI1kcApC6krocMEAd+RRHCqETkGWkoVn8zXXY/PS7QJ00ML
	LYXhhE9wRz/YrsTa3MNcaMIZt0YbEiO44wLWLCCQfAoXxkisK8hNTJKtH1fPMCNNrHWydJHPLvk
	VbRyaKFO+NyXji/YFE+aJEEAcgkL5tfFzo/ss/fdHcW7/nF/GYKxDDGtMbG9RG0WQyXOhbgjNVm
	SU1mfc/T7Y3oLE7q2zc1YIHU1AwlUiKlc0Wdn6vZEdgumr8g==
X-Received: by 2002:a05:622a:5910:b0:509:4198:5469 with SMTP id d75a77b69052e-50e368214femr103008601cf.9.1776530675066;
        Sat, 18 Apr 2026 09:44:35 -0700 (PDT)
X-Received: by 2002:a05:622a:5910:b0:509:4198:5469 with SMTP id d75a77b69052e-50e368214femr103008311cf.9.1776530674652;
        Sat, 18 Apr 2026 09:44:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc25csm1459952e87.26.2026.04.18.09.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 09:44:33 -0700 (PDT)
Date: Sat, 18 Apr 2026 19:44:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH 05/10] ARM: dts: qcom: msm8960: add RPM clock controller
 and fix USB clocks
Message-ID: <w5gdr3kdjxrmgwvp43mhb3zigo4nqr7msppsuqoo2fvd3t7mv5@47cgdd2q2iqp>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-5-007fda9d6134@smankusors.com>
 <7d25970d-c2e8-432e-b69f-0da99271b581@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d25970d-c2e8-432e-b69f-0da99271b581@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE2NiBTYWx0ZWRfX+qzTV4de7Ty9
 16BdnjDtCQmlXbo16lQ4kQu9JhKppv1/v51AaZUOyUDlSYB66TgS8xxacJYGNhahym3rFqJZMIa
 XXbhxGYpWfbnRnfQchBXWD5lgPqJubaTL/doO/t0qdKEpL8GifgC5QDgOwdJ0hPTWmw2OhVDaKp
 bp5o9o2cna/AY6m2hrm08O2naS+E5D/hB5yGQKhaJSwFRxSjBcC3/ErCABd6AMQF8Ku7bWjaPzx
 /Y/MFYuanMJSUgAirOYfsfl2Uzj4GJzNoefCU0tqnknrSIIgHB/w17NnnYlIrGDL5pIQfS2VT0c
 kHXcl9546Cn9W2/qKaUBUjEzm8FZK544qOnTeDIh4nB7pkCxi0y+XlFaUepFd0XjjfccxU5XRIo
 BAHqcmWJ7vqnDXN/mkvven5ehWLQeVLz1mUwqoXXEIoUptPoQGkQXPYGjIhpAM8MzrJDB09irX0
 uA7ja04rDEaAYDvc2yw==
X-Authority-Analysis: v=2.4 cv=dcywG3Xe c=1 sm=1 tr=0 ts=69e3b4f4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=wxLWbCv9AAAA:8
 a=-jnGadgR8V_shceC1V0A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: IsrVzs5NlebtZMjQt69W3mSy75ZoShj5
X-Proofpoint-GUID: IsrVzs5NlebtZMjQt69W3mSy75ZoShj5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180166

On Wed, Apr 15, 2026 at 11:28:40AM +0200, Konrad Dybcio wrote:
> On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> > From: Antony Kurniawan Soemardi <linux@smankusors.com>
> > 
> > The RPM clock controller manages clocks shared between the application
> > processor and the RPM firmware, including fabric and bus clocks required
> > by several peripherals.
> > 
> > With the RPM clock controller now available in the device tree, the USB
> > controller must explicitly declare its dependency on
> > RPM_DAYTONA_FABRIC_CLK. Without this declaration, the clock framework
> > would consider it unused and disable it, breaking USB functionality.
> > 
> > This also corrects the previous misuse of USB_HS1_XCVR_CLK as the core
> > clock. The XCVR clock is in fact used for PHY/reset handling rather than
> > as the main core clock.
> > 
> > A similar issue has been observed on APQ8064, where missing the RPM
> > fabric clock dependency leads to broken USB.
> > 
> > Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> > ---
> >  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> > index fd28401cebb5..1d5e97b6aa4b 100644
> > --- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> > +++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> > @@ -5,6 +5,7 @@
> >  #include <dt-bindings/clock/qcom,gcc-msm8960.h>
> >  #include <dt-bindings/reset/qcom,gcc-msm8960.h>
> >  #include <dt-bindings/clock/qcom,lcc-msm8960.h>
> > +#include <dt-bindings/clock/qcom,rpmcc.h>
> >  #include <dt-bindings/mfd/qcom-rpm.h>
> >  #include <dt-bindings/soc/qcom,gsbi.h>
> >  
> > @@ -98,6 +99,13 @@ rpm: rpm@108000 {
> >  			interrupt-names = "ack",
> >  					  "err",
> >  					  "wakeup";
> > +
> > +			rpmcc: clock-controller {
> > +				compatible = "qcom,rpmcc-msm8960", "qcom,rpmcc";
> > +				#clock-cells = <1>;
> > +				clocks = <&pxo_board>, <&cxo_board>;
> > +				clock-names = "pxo", "cxo";
> 
> nit: one a line would be preferred
> 
> > +			};
> >  		};
> >  
> >  		ssbi: ssbi@500000 {
> > @@ -507,8 +515,12 @@ usb1: usb@12500000 {
> >  			reg = <0x12500000 0x200>,
> >  			      <0x12500200 0x200>;
> >  			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> > -			clocks = <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
> > -			clock-names = "core", "iface";
> > +			clocks = <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
> 
> I still have mixed feelings whether this should be a clock or an
> interconnect resource..
> 
> Some internal data tells me this is used by:
> 
> * USB
> * SDCC
> * GSBI
> * INTC
> * APSS?
> * BAM DMA
> 
> or anything that is adjacent to SPS. I think any/all clients vote either
> zero/off or 64 MHz, on MSM8960. It seems to be an IP that wasn't really
> used for a long time (and a long time ago, at that), so it's difficult to
> judge.
> 
> I see that the list above is roughy in line with where msm-3.x attaches
> the votes (also for QSEECOM and friends).. 
> 
> +Dmitry, would you know more?

As per my understadning, those chips had several fixed-speed buses. So,
you are right, these are interconnects, but they are not scalable. When
it comes to such buses (AHB, AXI), we quite frequently model them as
clocks rather than interconnects. For example the same ChipIdea USB core
on MSM8916 or MSM8974 uses "iface" clock for the GCC_USB_HS_AHB_CLK.

-- 
With best wishes
Dmitry
