Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AC723A9AD
	for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 21:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771016820; cv=none; b=XqlBLNFV1WjpuKwGw7EF73N2Kh1lU76SKU2gpNnZ5k9ojQ4RG6irFpKhEBGt7w6DFc7D2cZCiIbTNtTO4I95eZncVgoFnF8s9xFk3FAXRqxG5E05WqCDWVxMDZJizydt9pu8XlHK8wId1DkUU+Cjc1GG+8Bf+K2v9XVdvR75iFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771016820; c=relaxed/simple;
	bh=pvX0qD+BxhDp4RHo7v7HNqfm4Toxz64yP3LF77EctMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qdC8zCtLAQ6Osmz+RERXaAAgxJQT2gaAAfsg/O5WnhClgqvF3fxKKJs8w+Bp47BJ3AqyVl8Gc3J0+22hCb5gi4zebpT0C4YsROuV0uNR0UY1mnimWnRzP8l+8d/BqSPEOrqBZTr/VqdJfwU2wy2wFQHjTy+3gN6Yfn34SlT0+Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MR1/BEEE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QZgsFNg+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MR1/BEEE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QZgsFNg+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DHRBn63796982
	for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 21:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fxTjLbHnLmXQoT5fNrXa0GhY
	+U/uWzDJb1svuEha72Y=; b=MR1/BEEEP6HKSDcuLwr5vcavcwV1FEBEXY0E/xZ1
	oN5i5j5TWjpegJIiNkQZk1z1nYxUSHylnrr1in3vGw46B4/EHAEumuVP0iTpbM+F
	5Kankz5xHFY3nK0PFBNs1SttOXxmjgF9j7ogAVCjl2R4NbwaavEoW1WalREoJms6
	FM3y4ttkdRsejtWJYLYmQ7Wv2CEigQDn0B0XvkcHlOD7WdYTvMCfk+wyw3c1Mc4K
	GvC7+cP8QMRG4BgZgbRsy10cSM+huuD1QntvYk0f2EmORnAz0FfmOjU0MQVLfFJN
	t8cn5AqBoc7Z6JQDlmFSMMpapU6NWZllBHVRyiQEdGQfAg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ca8ca8psu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 21:06:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70d16d5a9so434271685a.3
        for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 13:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771016817; x=1771621617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fxTjLbHnLmXQoT5fNrXa0GhY+U/uWzDJb1svuEha72Y=;
        b=QZgsFNg+sjrbZYUf6wSl+ZiuxQIx6s+1ppq+gu1sy0hueER9EWn+c059676ff/sYyc
         YcrYuRdaRxBKgD8uKSjuMxgyZ7R/XSlAN1ZTXPUMkV8CpAr4CPJ15cAzgNJYEz/uByhG
         LVEq6duCqpeVcov+RGUwmPtQozOE5cabCbhH5jBO+YUCvc2jBVM+/995dNoA1474lLEh
         bD4EcXIWY+7Alc+Z2jBLZx04rXap3zGMs3IQUlcwe769jIjQDldWiCkf+tvrd77m1Qwl
         s9MNRMDb9lh36pE0RA9ES+gFJr7QCobfzqpCK1OskHEbJRKbue9wiPszyJ4unNHTUJJG
         qGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771016817; x=1771621617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxTjLbHnLmXQoT5fNrXa0GhY+U/uWzDJb1svuEha72Y=;
        b=S4wZYPR796mw2oq2uRpRBaoFcqhKspuOtNeQ6/daC4REzNb+gysEk7Ll52uy9i7dom
         e5wg03iqywwCqkurmIglvXesTdBJexYSCBs64G8arhcmHTnhUSJWJeqYdVHjwiN7wIUP
         jZMPHCWA8c0OkdERHR6/LFmIn/ocljtnT/lBflm7yBRTmCJYbMvMcZN1YcOnMChXONo8
         CSBJLZiL61MnGT8MMQW3eRereK99GLd8Q+xpnD5KcK/GgQC6FZaD6aVGBvw6Jz/2khsy
         kouD9hLRzwLCw50+Xh1AQ6EKrnL425w0raf+7L8Ap8pMkVI7pWn65Dmdbie+Qk41n2Q3
         kQUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnetUIK6r0YK9WJ4qI2smXU+dxFdKRv98tp8+cmKp4o/5i2236lhJcEn8Se4kO+YOWH1nILtXfwUstyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHbl8Hlgo9l18WAI2kBkJ2Kn+eqSwavI7UWERq3y4GpMq7tai9
	7y0a4z5/nlubrWTOVi1B73yVXKTR4pHD5pi9A38NM7N43HnlQcd8TuQvAEC8Ou3LYS06E1Dcl+L
	+exrLsEmFzM7yQ1LIBSSgUzqKoq6Vxa+06dNJxjb2aVZPE0KsJnJaTphMQKHwHDFEaQ==
X-Gm-Gg: AZuq6aK67kQaSLQVl/p/eEpHTdzLX/FPD0N+LbdQqJ6UjlV2U8Sc1yMhBlieFyXjKaF
	dCRWiSy/odmKdTbCx17z7eZ2ir1qGEsUfNKB5FsLlAEA3UZzck2i2xG8wsITASf78o5FA7eK8nT
	js258Zhz7WNZxOSAlTiz1kyQK1jLrAkFgu5Dkxm6BmjIWTlr1W3i8JMdheAECJd9qdQCpbw85iJ
	RMy06MTiHME+CQTIqCO7SHqKHnFIOopH+XIB0zT/VTCxEqecC9RPwNcYFomCmSZWEmvv2EhyKn9
	sTx25lk6ewY/qqpSZx6SLHd54Vm49dXSlAI9C+eaF8g4dxnT5ncEG8z0oDp/b+OZDIbPgrV99CD
	svS0McL50a8tte2RcH72aM3AP1qgE71AC7DPwwourHMLfLYllTU0JaNw9Voq1cCM1JN/Frg1Z99
	MvTbaaJ8WG1DHHV3jNWnZVS+Hh8/Q7X8iJuJg=
X-Received: by 2002:a05:620a:3941:b0:8c6:a26b:7e92 with SMTP id af79cd13be357-8cb4bf7ea70mr126051085a.15.1771016817306;
        Fri, 13 Feb 2026 13:06:57 -0800 (PST)
X-Received: by 2002:a05:620a:3941:b0:8c6:a26b:7e92 with SMTP id af79cd13be357-8cb4bf7ea70mr126047085a.15.1771016816688;
        Fri, 13 Feb 2026 13:06:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b90adsm1772204e87.88.2026.02.13.13.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 13:06:54 -0800 (PST)
Date: Fri, 13 Feb 2026 23:06:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: milos: Add UFS nodes
Message-ID: <lvaxthcmqvjit4hnofqikxog3vi557elctiqc3nj3ere7rs47v@xcnwzrzc6koy>
References: <20260112-milos-ufs-v2-0-d3ce4f61f030@fairphone.com>
 <20260112-milos-ufs-v2-5-d3ce4f61f030@fairphone.com>
 <zvagnaxqgrpm6bagw6zuov4oi6o4b7vmy673oh5st22tec2swl@abvblxgray2s>
 <7zdyb2wnojudnrnomnx4aiwvni3e6i52kfioflb3gslztsizkw@ofvvkvrv5f3s>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7zdyb2wnojudnrnomnx4aiwvni3e6i52kfioflb3gslztsizkw@ofvvkvrv5f3s>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDE2MiBTYWx0ZWRfX10tDWuCuqp0U
 epopCceLoY2HLf94ZcUvnZNtbatvvmQMXh8Um9HVQCYvBh6hWfyGXVQM1+IXndD8HD1O4NM0+8P
 Xi0Plwhlst1xTwUzwrpHak+pKhlasSo8MY4rGg3oNJ9NqkibQRW05Dppcd1NAPjrM6j/+6sySG3
 fGI3hVHv9uhVkiqLBiXMTvMJ2x4t2qitiQyI2oo/bgiJP8RiIRxWdHwpBoIdi9XLA9LMwzp+pN6
 BYec7E4BvcmdPrH7Cuy3atCx4Yf4uOPjp6gykPy7ExgIOpIuMUKzJzwiaZfxf7dlZvJm9tmmdtN
 qwraz218ZbzKa5cMJY6oDeF0uvnwx2NFJI5yKAQgYiO4yWDazEoMRTofevwgMcOomrIP+xaYlua
 vH/Mnm+atHGPbAUkHdFSTNTCvJpIHARpRdEGyp2/ypKRgrecTkqfZiuNkgdd02GpYUqckrOS1NK
 xn9QHmPm/m3r4zXYD6w==
X-Authority-Analysis: v=2.4 cv=CZEFJbrl c=1 sm=1 tr=0 ts=698f9272 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=6H0WHjuAAAAA:8 a=qLpTsGN6TSyvEDe6a9wA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: bk0MGeMjRicnPfvN45R7Q5a-d8D45miT
X-Proofpoint-ORIG-GUID: bk0MGeMjRicnPfvN45R7Q5a-d8D45miT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_04,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130162

On Tue, Jan 20, 2026 at 04:52:43PM +0200, Abel Vesa wrote:
> On 26-01-20 16:49:26, Abel Vesa wrote:
> > On 26-01-12 14:53:18, Luca Weiss wrote:
> > > Add the nodes for the UFS PHY and UFS host controller, along with the
> > > ICE used for UFS.
> > > 
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/milos.dtsi | 129 +++++++++++++++++++++++++++++++++++-
> > >  1 file changed, 126 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> > > index e1a51d43943f..7c8a84bfaee1 100644
> > > --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> > > @@ -1151,6 +1151,129 @@ aggre2_noc: interconnect@1700000 {
> > >  			qcom,bcm-voters = <&apps_bcm_voter>;
> > >  		};
> > >  
> > > +		ufs_mem_phy: phy@1d80000 {
> > > +			compatible = "qcom,milos-qmp-ufs-phy";
> > > +			reg = <0x0 0x01d80000 0x0 0x2000>;
> > > +
> > > +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> > > +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
> > > +				 <&tcsr TCSR_UFS_CLKREF_EN>;
> > > +			clock-names = "ref",
> > > +				      "ref_aux",
> > > +				      "qref";
> > > +
> > > +			resets = <&ufs_mem_hc 0>;
> > > +			reset-names = "ufsphy";
> > > +
> > > +			power-domains = <&gcc UFS_MEM_PHY_GDSC>;
> > > +
> > > +			#clock-cells = <1>;
> > > +			#phy-cells = <0>;
> > > +
> > > +			status = "disabled";
> > > +		};
> > > +
> > > +		ufs_mem_hc: ufshc@1d84000 {
> > > +			compatible = "qcom,milos-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
> > > +			reg = <0x0 0x01d84000 0x0 0x3000>;
> > > +
> > > +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
> > > +
> > > +			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
> > > +				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> > > +				 <&gcc GCC_UFS_PHY_AHB_CLK>,
> > > +				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> > > +				 <&tcsr TCSR_UFS_PAD_CLKREF_EN>,
> > 
> > Maybe I'm looking at the wrong documentation, but it doesn't seem to exist
> > such clock on Milos. It does exist on SM8650 though. So maybe the TCSR CC
> > driver is not really that much compatible between these two platforms.
> > 
> > I take it that the UFS works. Maybe because the actual TCSR UFS clkref
> > is left enabled at boot?
> 
> Oh, nevemind. I think I was looking at the wrong SoC.

Is that an r-b then? ;-)

-- 
With best wishes
Dmitry
