Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301C12882D3
	for <phone-devel@vger.kernel.org>; Fri,  3 Oct 2025 21:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759527117; cv=none; b=RhPTRJxgHra1O3Feuu5pNp2rdrM6+W5ffylH/0kBl5UGOnez/bpK1d7JZvftXj9UfexgP0+Eq9FfqBAt486SqaYZ8i3UjiFK4OJcqhW2289otxVRkHSRirJZi8aCd4HuZYbB1kTRPbOkr3K7RuimysriUCJmIhhSx/Il9bx1/lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759527117; c=relaxed/simple;
	bh=wm9ZU493L7nyZfSKRNprptA6DzCCwoVPpIC7wpQR9KE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPb2lc8mQ3A+VouCA7JDxV2OXh3XLwQWVbxZlggFz26WWseawE8HAzQzdH+M3SXV2eiq4kwfaXcPl5RPP9L2Ac6Pw11uuXwww3WZ0fFoXm/qmZTWOFQ+X924g8LxMXM/nEtnIv68JBfEd8cZJ4bSIspDWnHkUOKiLwc0LSZRxNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Csy55Eek; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Csy55Eek"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593B2eAn032113
	for <phone-devel@vger.kernel.org>; Fri, 3 Oct 2025 21:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oaNyogpft37KQqjCqwX1Jc8A
	KV+C13HugtmRlZYmt2M=; b=Csy55EekRWLAgtg/vag9/RrMegNMhD65SN7kfmSQ
	TEyTyl4lyOcak/TOB2Qy8ezSOlmb0TnWl15RXKy8gDaDx3Yv6lkMajRu5N9oTPCL
	7pm9VZnTjSb1QBY3GrHEkgyjVWdwOL1sTwHYYOT5GJ3A65MejLpebIa6yBFhQkxO
	3x3n53HgbHDYo6lwo4B4EirAahH3lkXthVIsQw5nmrTHv4QSrpkGKmbQsVB0v3Gb
	mAIovm+ZA+oGGD6vNixLjhtDvatlQLZkO+hEXTkxNZ+EpIAwG8Ta1ystdYY/miyl
	AtsyIYN6Z9IkXAqdlsEr1NyruSqS2TjroaBkDmINuidNAA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x64551-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 03 Oct 2025 21:31:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d7f90350f3so56792261cf.0
        for <phone-devel@vger.kernel.org>; Fri, 03 Oct 2025 14:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759527114; x=1760131914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oaNyogpft37KQqjCqwX1Jc8AKV+C13HugtmRlZYmt2M=;
        b=K6zKcWynsdm9Z9t9mcEtSpl+U4W5KCi4nhwsHtUIyb4IU1NzJ4+fVxTYgUlL5rloCY
         aQIsjsOVCFn1pp+8phkY0dHghw7r1Mw3XdF2Do/DUB4zsR68+caUw7u/TcYtpPJ9EXYj
         XqN8nOh2i26walkmO1hXBxs+UQKI6NM6pCqZ9CTpE8QgTFAsPcJKxUuKO7PVyb1Nnbzl
         lPMNE5Ve5F2NP2T57KVQOdgOUTdVdt5b0CmOjD/lIiERq9sPJuCL1gUt65lUQhlduvFC
         gawbXAPukXRzmNJolCBaxvYIL3NijpJ4LQfWyEbKC5SMbJdCqXF54L+LpmzLxuX1JfSI
         N6gQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhAD8D02eHMsUyugb85kkg6nWa9DiI782QfuuCgSie6fqniFtaqNnXLTS2gH/3Gm4zeOwAJ5QzaP8ZtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjDqOmsyEwQxmKe6lA3hQTYeuzvkdXLOTgVT8f9awmrQFhWFKw
	V9J7EC4F5NqRrQyd1+k9i6AXYqhLUWLkPcBMu7/JOaI1fmZ+SZ/UwW0XdBbuCaL9UfjBy+J3RGr
	jPv9Sld0XMc/z+fxXZVlEgu2p6j3W8uheAWOvx681wsqvbHeZVpXN9AY6Ok885rBorg==
X-Gm-Gg: ASbGncv9uswQb2pnDtxxgWLNdN8vZIGCNnJS/ZI6eboOPN/PjLsykYIixDY663n9PmL
	0KKzwLnk4f/WvW49LWpvbt01bTZ5OBRBgKJcAaMcXYc4s1xerHqQhtlnZneoYL702Mgb6fuOdp1
	bOqXq1x+S17ZxMf0yypADzRO5IveE6JiHeowdDxw5TEFBtYsLPNo5VAnKnTQg3hPh7w9QHh0hli
	ZooVW/TKZGpor+MbMs+s33aykXAMGxxJNQP4TnaciAisruSINNLly5NJmPothdKnOqcQdmUBqVp
	hUXTDDZLBSwQL5rUq7XHzb5SgTcmp6RRnmDkI9mkEochIV+MXae5sNo/AV2g2Dxgsr7+TcHzc90
	HYraLffVqfHyQHP8B5Io5vGkCgcEX3HBAZK+Y2eFtci3/9Q/UvLvLpiGIRg==
X-Received: by 2002:ac8:7f89:0:b0:4b7:a1b6:cf29 with SMTP id d75a77b69052e-4e563c5e765mr134806681cf.41.1759527113829;
        Fri, 03 Oct 2025 14:31:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8uln0Wko2wLLU40Gc9Vh/f3dVBHUalTsis+iK+YSQPZfzQaGN1q6miGwZWTtBH0BVOLKuFQ==
X-Received: by 2002:ac8:7f89:0:b0:4b7:a1b6:cf29 with SMTP id d75a77b69052e-4e563c5e765mr134806201cf.41.1759527113281;
        Fri, 03 Oct 2025 14:31:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01124b4dsm2186492e87.13.2025.10.03.14.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 14:31:51 -0700 (PDT)
Date: Sat, 4 Oct 2025 00:31:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v3 03/11] arm64: dts: qcom: sdm845-lg-judyln: Add battery
 and charger
Message-ID: <fsqrhnuqmckxldsjejmdszlcfineaglt57g3vgm7fxwz2y45pw@avd5pf5beo7r>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-3-b14cf9e9a928@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928-judyln-dts-v3-3-b14cf9e9a928@postmarketos.org>
X-Proofpoint-GUID: 5nJL6XZHJwARRPi9iMYsU7RLc34YtDBg
X-Proofpoint-ORIG-GUID: 5nJL6XZHJwARRPi9iMYsU7RLc34YtDBg
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68e040ca cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=Gbw9aFdXAAAA:8
 a=PAAiZjNMvmahcd2zdhMA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX1qejUh0yjOP4
 wv1VVbzmUKAO8d2b5iut9nm+Jpl5pad98mGsQ3OYI+irlz5inTol5XlQ3cDkgTD3g8To8PasLTu
 jJ6bEsKphhsrxiFckAxGVU753GgR2qUh6RXHLg2w0ibZY2IegA710XDZXta+5ZXamLfnsfVp1HU
 maGvbTgh+IWOb5Si65KNATcRDFs/dQSgOy2dAiS7vtMzvWtnerNmyFaWkhjZ8I8H4BUM1KrWr8j
 MrhWZrMu+lxbnvv2L25Dc3lC3WyHxyV6rtAVtU+p+3R8WUdS8Vt/Ts1Gh1hbX5Uv33lViLlolpr
 Gk8SCkdUtDDT9gIJeUE0RaGkCpLqrAYw5ZT9gexV7aHbXuf1cZbg4dh98mIIrz31z/UX8XmH2BK
 liTL3wT5Y+3MKEt9wCCXjrXEkd6Bag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

On Sun, Sep 28, 2025 at 10:05:26PM -0700, Paul Sajna wrote:
> From: Christopher Brown <crispybrown@gmail.com>
> 
> Values based on lineageos kernel
> 
> https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-battery/LGE_BLT39_LGC_3000mAh.dtsi
> 
> Signed-off-by: Christopher Brown <crispybrown@gmail.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index f91578ce7195dc3bfd1ba0a722fb48f950816246..df65b0e32b195d2f668883542cfcabbb9bde8204 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -37,6 +37,14 @@ key-thinq {
>  			interrupts = <89 IRQ_TYPE_LEVEL_LOW>;
>  		};
>  	};
> +
> +	battery: battery {
> +		compatible = "simple-battery";
> +
> +		charge-full-design-microamp-hours = <3000000>;
> +		voltage-min-design-microvolt = <3200000>;
> +		voltage-max-design-microvolt = <4400000>;
> +	};
>  };
>  
>  &adsp_pas {
> @@ -57,6 +65,11 @@ &mss_pil {
>  	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
>  };
>  
> +&pmi8998_charger {
> +	status = "okay";
> +	monitored-battery = <&battery>;

Could you please move status after all other properties and insert an
empty line before it?

> +};
> +
>  &tlmm {
>  	thinq_key_default: thinq-key-default-state {
>  		pins = "gpio89";
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
