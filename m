Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D856F347FEA
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 20:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774385798; cv=none; b=WVYJtWkjaE0CpbR8eb/ksB8g2fSQ9JokIiXGGozCtgMJGaRHvjCKZFza2LOAe79pQZgK5NTOw1iJedczVqLJs7qJI14WaztoBuS54CJEQQLjCrUoUouvaSHbAWyl11Vez895+8J/47izPljWRWX9G9SgD4TZvgGvyz3ekcHVzGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774385798; c=relaxed/simple;
	bh=++lF2FXHTceYCLuNuh5+inPw2OVBfpGxACAkblj3Tu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXc0ICyxDAYkByY4XpT7hLq+7gKvDs2eskSt4cdBmEUKZIaz5ljyF6XmAE/CBn06OVJAacDYaqIgrG3I17/xLf0FeiQSv5uWqTiGcHGZ3VY56H42cpSVYvk9ZcpXE5G7VgmckSR0ozQfGw7Kivn8bwpzredS11IQMX4G3/wj+Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJaIX3XN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U9xHHnbw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJaIX3XN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U9xHHnbw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJOaXB1862765
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 20:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=08yduP2Mzil9Dxo53ubO/wwU
	qL5hcbdn8QiRrZwDKOE=; b=jJaIX3XNk1H6oL5dh2H9d9Qb+Vl4viVbjkh8JkIc
	44rgkuYaDSq5zKaVepl3KD2DID9ay0Rs7+F92gA4eZbnn8GHWIAbY5gjTDx3xTvz
	/WHfP2j9zS0GKXruUHdSgn5xzajVnaqIY7CCcgbccNoyAYPE4Ol0msAfO8J9KHYS
	A0MQQhkAVjC5++aY5wtSU8XED/g8CHOqda3sIuigrXdXlbZlwR6+/j/fOUHHsSKR
	i5h+WvG3BjBKvfYNW/7WOpx6eiiaAXfr1zskIEJ7fcAiOGXPknAPNdSDis9MzS1/
	xiaQFOlslUCPUGrNQReTQffLRx4aJUHjD7HCLsBTxpomLQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40rar83a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 20:56:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50917996cfaso120947661cf.0
        for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 13:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774385795; x=1774990595; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=08yduP2Mzil9Dxo53ubO/wwUqL5hcbdn8QiRrZwDKOE=;
        b=U9xHHnbw8NUcmEOxyVOrfTI32goRmqHHMOfSGoSNtBc0e4hzTfuyabmF9m84BVF0pl
         VjLRGNc/EsP2qRP2q3Ok3ziek1UUJ8/Li+NFAwyJgqWPtaEb54LCf2Xqyiyr3iBLsBUw
         65g6BBLKXN0Z9O5yS44IXfXV+WELsbr9dID/78fqG2n3JLvQiSmojvMxGGCax81oQNmE
         C9MYkRzlunKlHbRwAHdYja1C1cuWCE+inqb/EXIEaa8fqgRCOdMH9OLUTGmmTPCJvpIw
         49idK82W+77BONuhct7KjorkVeHdOEE9W4B4vIdZQm/jGfV5szVd12wgYcIGp6iebPP6
         Vw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774385795; x=1774990595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=08yduP2Mzil9Dxo53ubO/wwUqL5hcbdn8QiRrZwDKOE=;
        b=M2nzo6YOgaReNxjVjftAuv7fV28DOFQQ1ta5bpLXX7Xo9ZC8QUQr7aRiS+y+W5LYvq
         4UgHtV+dtmPGDdAuiZR89fOxOV3E/j3T7oV1lgC00AxUUuZr+3n89dODM+MPV8p81D1Y
         cx+od7+kzW2gTnb3vA2PZVGWE1JDCHMG9cqmhallJvieKC6ivnxk6DmREE5Q4RbD4BnI
         gaoeJfGFYUlH0uY7L4/LabrlLyACnkuh88mYdVhhc4MNClQEv2jKyTZoOAlOcZ5Flima
         H6A+ZRyBHGy6m2UpkaypACITKMM165QDEnwtGjwOZ1d5oz6eJhPSg5rvs4x/3+GOa42y
         iYIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDJLHPWtFWMWhYKxJTI7WU4fQGBkcnVRhAKgPVX6xrxgXskTjzw8xE3a7v3+7DrpUuWEmAi52rWhET5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyspFKVHVMG7mxYqcOL7dKHED2/2fZLELzw+D+5IS7DB3xIG47c
	A3Nfgj5ZOdA8hVAYgUTF+ygDdT4ecLcrEwgLckiOYC2dULDcctx2ddJ2EoUmPlNw4/j2vkQiYd8
	DccRquLLZffTj9miEoqM2coM2C09KZVIs4qLIVkvySQavuv6Svywbk9onh/XcbeHcJQ==
X-Gm-Gg: ATEYQzxMUQRd7G7YBwJovv3npRsNRBc41aRRUlbgM4D/8pM4LO5GGymxLmolydXEuUl
	PF3Hnz0usGUGoAO9oMLP6XT9+7wjUMzrGDH9yvrkeysfGfqe3qkScyWrXFwHXmtTGcuk116Dzcd
	DPEmu9R4aq7G7aU7F+OsmBLDeLng2J6iIuJMaRAOlg9xJw0FJZELwAvqbmvM6TSEsFSb+9+f/fq
	32gA+QDokO+zU0Hdcu91b7ojoU2X9fz/tWJ3pkrdYfw7RLReFlfETE2/j0whrwxPJFiOpm2HLw8
	PNCI9MX656O34MPP5E77hIS47f0vb8eipUhbMEQXR0UEuSrZriDbKnPQIJ9QNrskR9yse+4Ugzh
	VQZj6h02Mg6YzAzMgYyfx6v2StHETRNgzD8csKFvI8lfj5/lXEWWgPdhE4ZR5TSIadybzOoBThM
	UjvY1fXX79SS5wyNGLzGbDKfQ0K+BXKfHBN9A=
X-Received: by 2002:ac8:59ce:0:b0:509:17e4:cee7 with SMTP id d75a77b69052e-50b80d42d8amr18514901cf.23.1774385795342;
        Tue, 24 Mar 2026 13:56:35 -0700 (PDT)
X-Received: by 2002:ac8:59ce:0:b0:509:17e4:cee7 with SMTP id d75a77b69052e-50b80d42d8amr18514471cf.23.1774385794801;
        Tue, 24 Mar 2026 13:56:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530cd1csm3371302e87.76.2026.03.24.13.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:56:33 -0700 (PDT)
Date: Tue, 24 Mar 2026 22:56:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v6 09/15] arm64: dts: qcom: sdm845-lg-judyln: Add
 firmware nodes, change path
Message-ID: <4rafi4dc7dqlcracrowkpznelezu2bg4fcwur6vsm332jcmxx5@uhno7k3xv5jq>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-9-29d70ca1651c@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-judyln-dts-v6-9-29d70ca1651c@postmarketos.org>
X-Authority-Analysis: v=2.4 cv=Jvr8bc4C c=1 sm=1 tr=0 ts=69c2fa83 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=Gbw9aFdXAAAA:8
 a=1lR73kVuVWel2aiOKFwA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: _52I3UU6ma6JNmC3QfsCz3TbgPkFqq6b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2MiBTYWx0ZWRfX8OK/0uFsEo9n
 7c+f8l+aDN4mzzcxSQ9PTo+Tn3zneFYupLDXUhHmNXZ9HlWeqGbnbA7h1/s54ihMDAC02HSyENS
 wRq7w07ZIMeS85WxEy/5lSLkolSgeyGJCxV9IIuBKTmQxtK5CEnD1i7Glb16CZ8L43Y0ps8tXqt
 nycj3+9byxgr6sxQY4Obp2M8smhwpaVsXAviRPJ1y66YW2PCLaAJ2uK/Vg9ao5qfSJfnf9Ljyed
 vFpyWuHyf1J1lWIC35QRetaYZF3nZ7HZ0dkdxlhk4X2//bpiVvOY6M7Er4jrj3JLmBWxYUn+TYw
 0bAkFC2a37t4DXfhqvjk5MxuUHpvkgLnozeWkOOh1uFnMUqtOULca3efDe9TXY9LiYvTGFChcWQ
 nJIR185YR4QvevCZv2L7oPG69GNrEwybzR+K8gmfFNVpGLSmCfm1Wtjyc6ICjAvchDSwCmQBiAl
 11QYFndW3lRNl1ZGWhA==
X-Proofpoint-GUID: _52I3UU6ma6JNmC3QfsCz3TbgPkFqq6b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240162

On Mon, Mar 23, 2026 at 07:06:39PM -0700, Paul Sajna wrote:
> Add paths for Qualcomm firmware, including:
> ipa, modem, venus, gpu
> 
> GPU and bluetooth are confirmed working, others may need more
> testing/fixes
> 
> But regardless they will need the firmware paths specified here
> and firmware added upstream before they will work, so might as well
> get started on it now.

Please move this to become patch #2.

> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi |  2 ++
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 16 ++++++++++++----
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index a5a04ec11eb7..dd42ed0bf63e 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -464,6 +464,8 @@ &gpu {
>  
>  &ipa {
>  	qcom,gsi-loader = "modem";
> +	memory-region = <&ipa_fw_mem>;
> +
>  	status = "okay";
>  };

This looks like a separate fix.

>  
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index 46119630d721..7948fe3dbaa2 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -46,7 +46,7 @@ battery: battery {
>  };
>  
>  &adsp_pas {
> -	firmware-name = "qcom/sdm845/judyln/adsp.mbn";
> +	firmware-name = "qcom/sdm845/LG/judyln/adsp.mbn";
>  };
>  
>  &bluetooth {
> @@ -58,11 +58,15 @@ &bluetooth {
>  };
>  
>  &cdsp_pas {
> -	firmware-name = "qcom/sdm845/judyln/cdsp.mbn";
> +	firmware-name = "qcom/sdm845/LG/judyln/cdsp.mbn";
>  };
>  
>  &gpu_zap_shader {
> -	firmware-name = "qcom/sdm845/judyln/a630_zap.mbn";
> +	firmware-name = "qcom/sdm845/LG/judyln/a630_zap.mbn";
> +};
> +
> +&ipa {
> +	firmware-name = "qcom/sdm845/LG/judyln/ipa_fws.mbn";
>  };
>  
>  &mdss {
> @@ -128,7 +132,7 @@ &lab {
>  };
>  
>  &mss_pil {
> -	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
> +	firmware-name = "qcom/sdm845/LG/judyln/mba.mbn", "qcom/sdm845/LG/judyln/modem.mbn";
>  };
>  
>  &pmi8998_charger {
> @@ -167,3 +171,7 @@ sde_te_active_sleep: sde-te-active-sleep-state {
>  		bias-pull-down;
>  	};
>  };
> +
> +&venus {
> +	firmware-name = "qcom/sdm845/LG/judyln/venus.mbn";
> +};
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
