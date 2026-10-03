Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097072E975E
	for <phone-devel@vger.kernel.org>; Sat,  3 Oct 2026 00:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790988431; cv=none; b=Zv56ann8NTX4e950dBvXDnnl3nJKe2rBsY1rHmBn5TtsaiJ3QGJoUN3MeT3Jo2CxSoyj2SVQ3518iPAaPv6aQSnDtWlC+M/bfMzUByDkYn/TUS9w4r5P/POI4hiCxtRi9WOGinkMlaNtufDw4WAw7OsBSBxnkid5kEuQvOTQuFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790988431; c=relaxed/simple;
	bh=yTZUC6jKZaCOtbJ/3nZWWXEu0NQbc2ytDJaD5GmrxC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hd/JmGPgGYJnaeM+mpwy0FVTvUI35G2TEyarNg4ToSM0obNmMF6G/XIdoWIPuvMGIqS3eQpdBFtmJAT11y7kTTZnoo495zzQmfQIQA2iO82/lJB0lrViUTPbcWIzNIeH0rM7sw4ds2Cq85Bd0zx+l1BylTu/MogTlY1u3Q0DH1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MVAl5iG8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xcgl+DSv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MVAl5iG8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xcgl+DSv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Nei281957478
	for <phone-devel@vger.kernel.org>; Sat, 3 Oct 2026 00:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n+oeytl8ILE2lGP9tC08C8X3AyaLqZaWEZaYxX5SV4c=; b=MVAl5iG8Lo15jt5m
	aeO2/4y4NEt2oIlneY7iMQe6SPm7IIkm4YUip77RwFIkhAgq1b3DC7UVkazVlyWS
	409t6yFoHgIwQ8qaeBQKPURlGKJj8ZmU9TlgPjuq8Y+o8dRmh781mTMtT/9zRukg
	aqejn/IrWOxKbonrlb424CnFjj+1i4hhgGOkMxu6XXX/ZJQWH4j9p05yrR+iJOQx
	uKMlBYqVpHDoi5ZFbrGkrUlQ1gLyxAmnyUrxPeRT8xmJSu6rBufePqJzZycbBRy3
	GZhkIc1A5q15OAAPUwl2nKBBAQ8lssJAibEHtkVwisgzX+ADk+xfVTXyW6rWqURf
	3+SbBw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2j0ks558-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 03 Oct 2026 00:47:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so14750485a.2
        for <phone-devel@vger.kernel.org>; Fri, 02 Oct 2026 17:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790988419; x=1791593219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n+oeytl8ILE2lGP9tC08C8X3AyaLqZaWEZaYxX5SV4c=;
        b=Xcgl+DSvnatLxMgCFHg5oWD+xMtlBHD4ItvEeNSLDL6CRitQHzbcnjl6fPAXwvN/7i
         Za/U2YSKGFlJhwBGfmKPJYUka8/vCfvUaOkXp23MFGGw7/5MqyeRBuPdzPKC/TcGlMAe
         D9hCltriu8mwCvlPTRdIokuLNM5NK6tlqU+3G01D02QK7MZdTojeTBlFrAxqpAyils0z
         SgEEqyIJxQqQMqtji9DctLUKW96U8ycITMYT1Z3D/nd0nzi01MzSbR7NVUfF7IQkalrz
         TC7VwFgbYGy9ld2pYg2Y32en3YdzxpuQe9G5rzyymzWrE7SUy0cH1IT9BR0Nh5ajs1UX
         OVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790988419; x=1791593219;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n+oeytl8ILE2lGP9tC08C8X3AyaLqZaWEZaYxX5SV4c=;
        b=xwU6uYgY1YaukipsxIZ+fQ0PT7ScdBU3ztg3VYP6QC+8auBoK0qB2+tLWlv5oTJdDM
         K5uqW+PmLpbQ3hnz4oiTdNAg5W1/BA9ttbiTtWp0IrApelzftOLDeDKwWyLwWvbg32xm
         hqh3hfYpwH4qqWwVaEdaPuvR2Ehz9QXSeYowDto0zLi9+zjMh5XTHmr+aU97WY+YSgF1
         OJD2hTtzIX9OR/7+69+JlEtqx0Dtdc7TWETrkv9IIQRhhy0exEZwI/FGjtdmc0B9zgYO
         K+RoFBwvSkn7bnN7GbzKxxHka+jVS5jrcz1wjySAwVBEcz5I6cU7SKNn5cGmSiOeuPSw
         qgKw==
X-Forwarded-Encrypted: i=1; AKwUvBz7/UTxmyVvKak4rnmA7AA+Bv8y0GH4RtGgYPAVM+HabWN4sLYVR75oqwb5hXn/Ld4CenwCSmgecDgiXA==@vger.kernel.org
X-Gm-Message-State: AFuF++meIQc0TS7EoiaVeyIiI9bXWmwhehcw9gtumxq5VHT2uPMRx0MK
	4vyB+01hXPCttOFeC15pyGW9CEo1gAgWQOgWt47FU7uvH6Oz9R5exvQwdpw1dIc8zn4rdvV7G+z
	qaS0mdYToPPV/Vxp7Wwl+4lUJQZ2lf2OYTUEyZvuhNbWbPu8HOUHO9hEbZZTo2Fn9dA==
X-Gm-Gg: AYBFou2JZoDXXIo8VyBmyJFE4Lyw3ZnJIhmWrS/5kvknzn5b6oy2YaCfEOxIg/sa52Q
	BpI1FwoAFt3q/T1WhH+Mnbcp85pMjeTM3NV1I/vPsP8tSCa+/7KhcfyBiRYMZAsvPUjutDLhshO
	O1m+WjK7JhxxCDIF7GAusUkbxFWMx6zI8LDls9WgmMFGtjc3QXhf8q7ljGNhXTltIE+hsDDEb0M
	9htQ4MNeBHXv+eT77691wOeit41Ax7pdbYZ+/M+IfwRZai3JtDxiblrOYwBpa5cYV+tBrJkt+FT
	w6D8KmbFxxVDUZn9x/jxBTmAo0mggdkSZWs6ODI32DkMyfSULKtqs1krL22x17B192Pc/LlSLOt
	Lsme+JlOosPb07p8aAPTI5A9fi52AUMwAtKFG2XVcdr3OjEXctJHsuO84E4fARunTY24jkKtxd9
	qJnQSvs3O7kv+w
X-Received: by 2002:a05:620a:278a:b0:93b:d7a0:d9e7 with SMTP id af79cd13be357-93cf19d98b0mr819175185a.65.1790988419236;
        Fri, 02 Oct 2026 17:46:59 -0700 (PDT)
X-Received: by 2002:a05:620a:278a:b0:93b:d7a0:d9e7 with SMTP id af79cd13be357-93cf19d98b0mr819168185a.65.1790988418537;
        Fri, 02 Oct 2026 17:46:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c71911bsm1160748e87.11.2026.10.02.17.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:46:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 00/19] Add Initial Support For MSM8952, Add General Mobile Shamrock
Date: Sat,  3 Oct 2026 03:46:52 +0300
Message-ID: <179098834078.3641559.798772743228949994.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921-msm8952-initial-support-v3-0-b96fd3fe298b@mainlining.org>
References: <20260921-msm8952-initial-support-v3-0-b96fd3fe298b@mainlining.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMiBTYWx0ZWRfX2yxxSZZwa3bd
 Z96ppnlTpmFfGHXmBalN0D+hAesxA7Wdf4YEAJ90siwcEBaB/u5R3SLvuZGR+XR8pE0V8orOoS3
 GGtXznLCEKPnGJcfIP6Lr/saFjtDzNcNCSWZqGbmZtgJc5AIM3gfirx/A3Ma10OqsBxJb9SuFcn
 WgeteNsy5ykXxxNSh3VaRiBnndhdpjq8o6d6VCVbmcZkN5w17doD4ub6osOpjVoC0H76z+FTI0o
 DKCsZOiMPg+/50waNYm0CQgJFyP+O+j4QO0oXClUkTpWbzn8AxafYOB1/vRW7mdzgMVdc7fqvLB
 ma0fa0yqGuNCPIlHBEeKbNo+bgGjDiOjQNO0KpNMEpDS2zFcKXN3mVl0SrJersNEPK21Y37oHiC
 nCUZIAUsPLmVb4JQJLVucYeLjP4V5HZPjbFEVLkoX8GcQJwjsxoKlRS+y3DIxuZqsKGE/qpnQfk
 XCpfJX6BdxsC0UElEuA==
X-Proofpoint-GUID: _aaM6PxIHXm-86dfua4k2GGoT8PR3p7l
X-Authority-Analysis: v=2.4 cv=Z8B5j3RA c=1 sm=1 tr=0 ts=6ac05084 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=e5mUnYsNAAAA:8
 a=sFPzMUYdAbi3-6yuofgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMiBTYWx0ZWRfXzGz03PJMr8Wy
 8kmrXxTr5nOOlWTQzy975g2R33/6NDPg4i904WTpMBT5PnL7rABneFDY5NVibfObcMOqNMrqX+J
 oqAb4N1pn3IJotN2+jJ8J3/IzypmVUA=
X-Proofpoint-ORIG-GUID: _aaM6PxIHXm-86dfua4k2GGoT8PR3p7l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030002

On Mon, 21 Sep 2026 21:18:51 +0300, Muzaffer Kadir wrote:
> MSM8952 is a SoC with 8 core cpu and Adreno 405 gpu.
> 
> Ported without uart connection. ramoops and usb
> mainly used to debug.
> USB is not enabled in this series because it
> depends on the not yet upstreamed (and not developed by me)
> pmi8950_smbcharger.
> 
> [...]

Applied to ttt, thanks!

[01/19] dt-bindings: clock: qcom: Add MSM8952 global clock controller
        (no commit info)
[02/19] clk: qcom: Add global clock controller driver for MSM8952
        (no commit info)
[03/19] dt-bindings: nvmem: Add compatible for MSM8952
        (no commit info)
[04/19] dt-bindings: power: rpmpd: Add MSM8952 power domains
        (no commit info)
[05/19] dt-bindings: mmc: sdhci-msm: Add MSM8952 compatible
        (no commit info)
[06/19] dt-bindings: vendor-prefixes: Add General Mobile
        (no commit info)
[07/19] dt-bindings: arm: qcom: Document MSM8952 SoC binding
        (no commit info)
[08/19] dt-bindings: iommu: qcom,iommu: Add MSM8952 IOMMU to SMMUv2 compatibles
        (no commit info)
[09/19] dt-bindings: mfd: qcom,tcsr: Add compatible for MSM8952
        (no commit info)
[10/19] dt-bindings: display/msm: qcom, mdp5: Add MSM8952 compatible
        https://gitlab.freedesktop.org/lumag/msm/-/commit/df6ce9e6447e
[11/19] dt-bindings: firmware: qcom,scm: Document MSM8952 SCM
        (no commit info)
[12/19] dt-bindings: clock: qcom,rpmcc: Add MSM8952 compatible
        (no commit info)
[13/19] drm: msm: mdp5: Add MDP5 configuration for MSM8952
        https://gitlab.freedesktop.org/lumag/msm/-/commit/7af226f9aa59
[14/19] soc: qcom: ubwc: Add UBWC config for MSM8952
        (no commit info)
[15/19] dt-bindings: thermal: tsens: Add MSM8952
        (no commit info)
[16/19] thermal: qcom: tsens: Add support for MSM8952 tsens
        (no commit info)
[17/19] arm64: dts: qcom: Add initial support for MSM8952
        (no commit info)
[18/19] dt-bindings: input: touchscreen: goodix: Add binding for GT970
        (no commit info)
[19/19] arm64: dts: qcom: generalmobile-shamrock: new device
        (no commit info)

Best regards,
-- 
With best wishes
Dmitry


