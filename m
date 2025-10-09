Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFF823F422
	for <phone-devel@vger.kernel.org>; Thu,  9 Oct 2025 14:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020932; cv=none; b=iOhnXjMiTN8+TQVUD3u5l2ez/xcbQ33UTwTGZ1LfH7F2tio386f0v5FQ6+zc8TFuiL02O6nGdVEp2jquLPC5MrGH/WLapxmJoVTPY9hu93J3heeXSs1dM58tdQg/CUq//Fr079lQ5RTKN0frs2py/XH+nLp7wuHc1wlyl5GxjJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020932; c=relaxed/simple;
	bh=QZx4nVpAC3vRxTaSdKPSim4kZsjFCKfjifLXoOWygnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3bJRxEBTxK3u97VO9rV0jFwCa7pViYoK4bHmU6zctCeq2OuWdrXoODSBOH8NUIvDw8FKzzzyQXzJL+veFKPIdNO6vPc4ZetA3hh4z2y1+9IC7iXaPyv9CxgJpSuBNhOHSn7TjOWW0WjI5YC0y02oYaLpTjXnIyxSmqUo7svFl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSnJCb/8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSnJCb/8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EcfAj012274
	for <phone-devel@vger.kernel.org>; Thu, 9 Oct 2025 14:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jJVTkHydqKBrCSgwLkXUZtm0
	Z8WJjCWEqwuofJXX3rc=; b=pSnJCb/8DG/0imYlcFsnOQfpkVy0tPFrexiM27Es
	VwcAVfuKZcsW28YbjfY3vQeTC+4jNhfUITg0FTmcYCSN2jPbp8EkUf/UpIsf/ccf
	JaA30ZkS9Hajd8P9dDBfeuYv73sNe899yjgqxFijOnC+vcTVTdUv2MgD/6TFH5Qv
	XcmEez6z88xhOlvKhsgbzDNb3FAZoXYiz0aiVrc3oZomrpWgSl64UbaCyck92DLn
	O4PzzeBfDuXWu/Af+lU+FunV40heM5uZHW7lUM4t8aP0XD8yfuzo7/T4CjBwsXI2
	i1kvBccJ9G9JpM+/n4z8dBywPjLlRUknlSEpi5iLG1+Veg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kk7vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 14:42:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e574e01ed8so33502281cf.0
        for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 07:42:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760020929; x=1760625729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJVTkHydqKBrCSgwLkXUZtm0Z8WJjCWEqwuofJXX3rc=;
        b=UevX7FDP005t5a1QlCDtckoFzjoEo27suttSlC8+7lgJRMZCLtyq889ZgAmMtwocVQ
         ykMcfvToMcO6ZF0rh8Vl3u6z8nKRNXcsDxjw6YFgy6qQciRSLNwoqRBJCbpFLfiOUZFC
         DaQd0m2E1eDOvvkW0ZEyaEyjFo21i/CWA60EN+3SOSVNocoAAfWzpoudStms1MeLaVEC
         Dvjpf9zQt3L85QZpvfx23sdwItKgrxovwDhlcrLPuEfqVXcQFaqLcfGTGNnRkM1m3hJf
         2TIqxWcGrnPn7WaUU7aShfVDnLqre3/G/tw5Zk1UQISn4Rarq9R/X5uqiCD+Wu5fbbVJ
         uJsA==
X-Forwarded-Encrypted: i=1; AJvYcCUI0nCr1AsJYIXq7AWmHnLps8vOddUSameMoLBavHH3tsoIiJOZHtGJWoE4w1d/paNM3uOTDh10vVfJKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7KDHLQoPTDMuy72xaDVQDHmJXrIoKeRm5pOpjDIyerqJcpO11
	/UMEaVAghBWq0ixL+Z3ZLHhsr5SWyOmFewyCbPB4twP7FqGrOZyzRjflC1DBNF/PzKUi5KrIalZ
	X5W4ZMVVGCP1XjX3wFy+yYKaDew7R5rdYA+wwz26W63v18WX4Dw52i4adtcmOwoKFuA==
X-Gm-Gg: ASbGncuXaKhQHda6dEPiQhb0g8ZIDxc1HidSqh64XmkUTqMc8hhPrj/tzH4Lg73+4xW
	jHQxi7edCwPTRoA0VK3v7hHnGNVlTt8noeoE1o8bqz5wK7d4hLZGlP7N2w9t6ZhyeL+ta1DBpfv
	Ve/XmRTumHXaAwbUsN6TOK3ALMZSF8ob2bLnFV0qJQIeWKmZaRxefeUtAS1CYudQGRSHxa68RVu
	T2N46atW8NSMZOVb9JaP70n5n2M0p65W1xlmKmqTi+xCZXcPdRZIp152rY9sBLdyHLMNpVtcvd9
	GkyXSnF6gS2lm/AEtZLjIl2EishhHnnDd0TNaigUtFLhH4Fr8+8DHe3wjR60209RLGzObMqXZBL
	mnqfOy+SD0fkPiJF+JeCYOvGN9mD8y+s+UMaX6qdI+cjnh+RE+mLMfciK/Q==
X-Received: by 2002:ac8:5d53:0:b0:4db:347d:edb3 with SMTP id d75a77b69052e-4e6ead712c7mr91268501cf.80.1760020928690;
        Thu, 09 Oct 2025 07:42:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNa4QnjcuKYB3jwjG7GLdf7ymSiMVsjch3Pok5PTchB2g1Op9BuA64It2GGfI8BAkwpNNtAQ==
X-Received: by 2002:ac8:5d53:0:b0:4db:347d:edb3 with SMTP id d75a77b69052e-4e6ead712c7mr91268131cf.80.1760020928280;
        Thu, 09 Oct 2025 07:42:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907ad9e55esm1097574e87.78.2025.10.09.07.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:42:07 -0700 (PDT)
Date: Thu, 9 Oct 2025 17:42:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcm6490-shift-otter: Enable RGB
 LED
Message-ID: <rnlkxpm6crulpvfleclkszio2fms7t3ulc3rpsdozteml2bak2@zvfuyc33ohez>
References: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
 <20251009-otter-further-bringup-v2-5-5bb2f4a02cea@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009-otter-further-bringup-v2-5-5bb2f4a02cea@fairphone.com>
X-Authority-Analysis: v=2.4 cv=dojWylg4 c=1 sm=1 tr=0 ts=68e7c9c2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8
 a=_tRjzsPFGxlTNT5lhXYA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=y4cfut4LVr_MrANMpYTh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: P98Ch9Ap4clTz-iEqkXgEBJRus6J_ssV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX0H61zr0gPPUi
 MkfeI+J6L+BlwaBmg5UOesVvr0HHc6uTpDLjIY0cGiZQEXT0XU284sykfwUCYDJaLZ6YryVMf0w
 K+U8zi09Wy2HoqZQRytgeCDcdayPMEmaf2GKXpj7Uv9PeqMhBFu7I4+G+QZVl66jIZMaES0HbjI
 Lz7PyetRzpb0M+tB2gH9FDa7PGoIJ0rVwjKLe+uemZOOT0KNzqqg4n638BzsGgvcwActzybYl0h
 9MbYOcgma5w6HalM3ZF30eI6AeOXgDnqBU9dxoag3UACEfLTFBHQJ8OXx2rG2rGlgQfXTvSdZT6
 4rEnI3qI+e6VgDF8xSQv5dpUrRbWp8VLwiARKcTp2CZieDfqOrb6GdwASYulr+DKZGr1891hoiR
 ZKsc2TPIpqAKA2gQDWKZIoM4075Nzw==
X-Proofpoint-ORIG-GUID: P98Ch9Ap4clTz-iEqkXgEBJRus6J_ssV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 11:06:35AM +0200, Luca Weiss wrote:
> From: Luca Weiss <luca@lucaweiss.eu>
> 
> Enable the RGB LED connected to the PM7350C (PM8350C).
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 27 ++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

-- 
With best wishes
Dmitry
