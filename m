Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748D237B02A
	for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 11:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774265303; cv=none; b=GJjSLNFUctL4qT59IEobowAWqSXk7kCcIn0oU/vRjsABjNCwZsl02giQPVEyUGSxKVMabunhHhaxYsgIOOn4ZqKi0t4WF5bFuJZtnrEW76kFvq2fbYOxYjOL/mYEJMQlOdVz3yF4Y2CEgsZXUiQ7glHCVvBZwQKIEGLPlIeZI5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774265303; c=relaxed/simple;
	bh=P0lgVEvoBBzeXOQHdJFobPCFwkZqzwkaKNHhWjCx0sE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qOPx4YRul8DzzVt74QVtQYik9+ZfCPR46d+CyefbGMDm/lgf4on8dN2bmbMPFe9OhSk3lXyByqpVX1A3BicKSuBj82uA3eA7atuBMs+K6yoHAsd0jm1Zvn2socu6Z5Ha2AWAMN2KPQAGmjqclX7wDz/NficRRlJnfXarcVd1omI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JbTYtvET; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOdxMcqn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JbTYtvET";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MOdxMcqn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NADmNm3539788
	for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 11:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	otLGVBC3RcY9v/x19x7aTlyFu0Pant4SdxjD1/Z6jQM=; b=JbTYtvETWYt2Hv6R
	7rkcK0dp89Vy3Idz0atoCVTltiQ2GpY0ZuzYiGip4Pj7jGHq9zZDnMO7FM2oWZ99
	Jj3LiiyTawQCYNLnYri+SyKYuSBOuRCjtVupGTN7wvBeHLgxI1ZqnsuAJDMaiVaX
	1bfiqmYBjPc7H1ZznN5ROtL+TZViVb2lUUQjpbArWQ5jrX3WgByoaF8ksE6KfSnv
	k1tcjbx8UoqQPPbvAtJl37UV1jQbXAWcuy5UHxGase7PD9ej3xW7PUpwo19koPfe
	TtIyB46hoWC5ht2qPOJdygXmECaPJLazmcno+lpV+L1FgfXjs8ifE9xGLAOr8ojz
	zkiKrg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k30837-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 11:28:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b32feb719so26869301cf.2
        for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 04:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774265301; x=1774870101; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=otLGVBC3RcY9v/x19x7aTlyFu0Pant4SdxjD1/Z6jQM=;
        b=MOdxMcqnnY9Z2Qj1xGtjw5F2MFUUHN3b9BqR432tRiQYpk4YjpmqcNz6TZLBKeVOBu
         3Gcc6E2toWCNCMw5qX+aZB6r26lB0ghjrfl7lnKOdYZqIX3zoc3V3A5wW8gK1Sn9jDep
         hg57B3wf2/gvEUv0yrgXZRFytVgPTWNZlYcw60Y+r0ixdYq66n8WJ7jSZIa2WhfPL/kP
         TlarjN+3+llIhhywB8klCpS3aTufm2Z6hkjaJVPn+mc+SmO56yjdPFo0RV+eOoqj+M4+
         tHu6pRixvPmVYrZsUtflVB9i/MixENJN32QcwwAiZQIx0zRHZLuoMmdC1gWreYfQ8UPI
         bsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774265301; x=1774870101;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=otLGVBC3RcY9v/x19x7aTlyFu0Pant4SdxjD1/Z6jQM=;
        b=SComB1OHe/pcXPDiUnBH12fXNwmzKpnP9pgTLbVyOZr4qpzbzqcVGbVjQROutCfLDb
         UwYEq6fEfla6zrVhHjMyOJUwyJKbeyEzxCU4fNSAlzoSAClHCBrh8qqCDP0qgQAS4Htz
         FBf8o10CgtTvrpaxXOCvrd32MmMBhvwmBvGVq9wMHaa3P/x2Y2lVSeOmWE+8JqoAowJC
         FfRihExZ3dQOpwM5Hnct8ZEE1t7eFEgIoHpc3F5nv+85j0KLIWbjLjImtNjNV0JVdNjv
         753rOaPeDegO5KccOtVbYFAujxYUfxgybCkXusbmNuiQPN0pOD8JjpPGEV0o/z23klw/
         MvCw==
X-Forwarded-Encrypted: i=1; AJvYcCX4Ss4cWk3hF2EHWQLJ727sFHfJVcmv9yhFmsD95dzkC5h/+C2tr66RdB56VR7FoV/v6w6Bx9GrTvWdWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz2JraOfYeaDP9OVMuJI/dEBbJjWCpZMwY6yKAJNSxdFGmab4V
	S4JSsy0NG6uC5PyzdTVzbLah/p2mfTv3c1Px1qijmvEpsMbZpGi5z4APeglcmWYhCfPsjohg06F
	1v1NI442X5CRZ5ABYxWHYLJQ+0t3gIn/ad6iXX+WHmG1NjyJLrPgT/ktayxRf+g1dpQ==
X-Gm-Gg: ATEYQzwYjo+bDNG11sRDf9ZWH4PUugDzPqMwWzsMnC5mCO+rINbK8nEbKVrE+Zu/zSO
	v68RpSxmxHbpKA6IQeyDuAarmUOBlQ2NAuiKiZlWYhvAxvd4qXBFDVKVr8/NIq5Gm3qX/iVArA8
	nQjC3OtWNIYtoB5KmQtWH0NWdaqmGHGRlTpJPSlisVDUNBY7/AJxyqa1HlsgQPBdsI0pgrZYUBp
	vp6vjAZVO04gM3356hpxeWrlqlUsaN2/xNn5vDVi0dz/hwSBobKKzPsugt+qJDvirn4d4INgtGl
	/XZfkH5SNcVfUZqonPvxkyVRXmErSVslYZRBYZdFTtqH3qyt4Ek+EYUedNdCXJo5sFET2CY605c
	yl7EjdSiGERETDrCS6/Suy0qSklrE1qK2B17KLsIpPnktEXQzTcTuSC4I+2qKYl5rRz3sHt8W5L
	ZTYMk=
X-Received: by 2002:ac8:7f0f:0:b0:509:1924:3f60 with SMTP id d75a77b69052e-50b3753fc76mr133488531cf.9.1774265300901;
        Mon, 23 Mar 2026 04:28:20 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:509:1924:3f60 with SMTP id d75a77b69052e-50b3753fc76mr133488261cf.9.1774265300425;
        Mon, 23 Mar 2026 04:28:20 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8ef74sm473465066b.25.2026.03.23.04.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 04:28:19 -0700 (PDT)
Message-ID: <ba3d5ae1-38b4-4ea2-9588-9ee7bfcb0675@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 12:28:16 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sdm845-shift-axolotl: Enable sdcard
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Casey Connolly <casey.connolly@linaro.org>
References: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
 <20260320-axolotl-misc-p1-v1-1-89c9b5ecb26e@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260320-axolotl-misc-p1-v1-1-89c9b5ecb26e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c123d5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=QAr4PxFQ6c4scwZbW_IA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4OCBTYWx0ZWRfX8OtSv7X+tB7b
 vqTO0/dlQwhUzgDgt/vq1l31c1e9LYOEI7r/pbSdvrfimH+10PEODZafRb05znxYAWluvmw8l4D
 vGgZdp0IPHntRHbCC+wVn2oRcp49fvre32r+4Qmt5GLpZWHKD91vVG55ZXl/bJ72VJ2COLmKGIg
 V8i/noWwip933qChyOIegbQwWwSWDDHW35QZPoOVlTcSFyV5o+DBTpjgNp0YpT9jyPEjzgDIBvP
 M88fi+7YRJ7GbaBmq8GQM2Z1MJymFlFs9dyd6VVwtE+UwfIS03fVNTx00mOTcxDDpeUs4ba2EdY
 zQ6pcHiHRpha8+95AkwDojS4eMpUewG2JtB58SeIBy8AJ6qWJ9nyt4jxJP7qhraNkbIWM+mxJhR
 rV37zYvflYsjsifcKPqkl+Xpqr9yOkXSkPbaL8hB+YbB9vGD4cZFC8Wa0TpKvT7TFWtgUEDxacB
 6+X2aBeVh+SpwAYIMvQ==
X-Proofpoint-GUID: 2MZklAcDzkYAg-rYTpvxajKwwpXJeiXt
X-Proofpoint-ORIG-GUID: 2MZklAcDzkYAg-rYTpvxajKwwpXJeiXt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230088

On 3/20/26 5:29 PM, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> The SHIFT6mq features an sdcard slot, add it.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 43 +++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> index 51b041f91d3e2..1f21da310b762 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> @@ -600,6 +600,23 @@ &qupv3_id_1 {
>  	status = "okay";
>  };
>  
> +&sdhc_2 {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;
> +
> +	vmmc-supply = <&vreg_l21a_2p95>;
> +	vqmmc-supply = <&vreg_l13a_2p95>;
> +
> +	bus-width = <4>;
> +	/* card detection is broken, but because the battery must be removed
> +	 * to insert the card, we use this rather than the broken-cd property
> +	 * which would just waste CPU cycles polling.

Since it seems you're going to resend anyway:

/*
 * foo

Konrad
