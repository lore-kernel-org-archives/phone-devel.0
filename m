Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5844F21638D
	for <phone-devel@vger.kernel.org>; Sat,  4 Apr 2026 21:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336538; cv=none; b=Azy2SAL+VqW0DL7wS3JOsBCx/beqes6WP5rQfEQIy7CA1+4KKKQH+tvfEp6qte3FcGLgqsDdPy/GYQmQQerM+TLdj8cwyxluK0X0Os2uAo9irBC8pmTFVEHAtTVvM6JkDMOnrTypyuwFngPwYvs3SH8MCTuUfS3BzK6I4Gcyzv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336538; c=relaxed/simple;
	bh=M+11Bqne1ZEbBP552q16E4pebXsWAs4LLI08kLq/vLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uuMmpgp1WSU33Suy2aSYuOY32UgDBUiVgzb8AWkzwVd25k+F52Uc0uFis2vssokQ0PNLq5SJr9C/NYjomaMvIlgmHGSkain2MvN2JCfQX9Uu82xYtTrWtXKbUl2ejAlq1LzGvA7BOA9zWpSGNVQuWUjxNCulXYCi6fdS9FI1vdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cb6lh1Wb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EBIgZvN6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cb6lh1Wb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EBIgZvN6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634Bc7ls473322
	for <phone-devel@vger.kernel.org>; Sat, 4 Apr 2026 21:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fPHbHTmrz5b69W2HbX81pMl0
	Mb3P+N1Jkbf+3Ti3CC4=; b=Cb6lh1WbqZF67viqKoBgkYUQW/wTrwHq3kSFBBW1
	fLrfpE5IJIPXqYdcrnR2/Z/Mb2+iGyq1zUtmwVWr4LMegpAfW/FgB5tEOZlPlPWq
	9roAlVL3QAFwv9ZSWgRCoakovk0mDIhY+yf/HLZBpy1C3JhQ4igu6ONHtueBo5de
	SBYNL8lvfg1/SmNiiBrGPRQx4PUsJ3kfEBwcikMArm1KG3P52ZKBzqnkbO4BCKzt
	AO/k9Zyt4iw/Y3cj/qKbA5Yi5KzP6UqQo4e9Z1t8xRKxubcffTt6C0ZW9XScq6IR
	w7kJVOO7BDaUodxyEXMcZnUK0kfVVl0pDvUsyi8ncAY3Ew==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datqshepv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 04 Apr 2026 21:02:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093b92f327so82521591cf.1
        for <phone-devel@vger.kernel.org>; Sat, 04 Apr 2026 14:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775336536; x=1775941336; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fPHbHTmrz5b69W2HbX81pMl0Mb3P+N1Jkbf+3Ti3CC4=;
        b=EBIgZvN6k3Ewz20qlNCkNiRkMc26RzSYvB0FTzlrK75f8o4rEOP29oxwMWh4+GEw+t
         Sw1/X8BYQP79AKL0dX/hQej6pKS4YiJ3LsmXG0gg4bjZa1xvWP8Plh3+KS1O4pKRed9F
         eu4AQLSmZ1/UgOivGmWhL43i6Henz3EGIv5zF0m+1pcvhW53MvJU6WF+1sG4wpdEAst/
         c4s9GwMhPit/+3yx26zovUiyAuasAfV3/Dt/Fvrta2dgghBVXlpTW1s0x0lLnV2XCaIo
         XTjZTIAwO7Jyb3yPW+o16W1TDQWFb5uluT/VjZtpbqHX1+KzuuZBiX+DZYSNatenEOMK
         7eGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336536; x=1775941336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPHbHTmrz5b69W2HbX81pMl0Mb3P+N1Jkbf+3Ti3CC4=;
        b=Y3EG8jCpS5gZGlRIsc9buKXR9fRlA9KzTwtHQFbZB+5UumSSGJAJLfWlUqMylaJet/
         yjGMdm5bx+inKAIHnrV4h6aYFI2gdfoqipRLmgNAR1fjBg9kF5f2Mq3fZ85G/TieCH8t
         5NqjgBA2OE0xy9ZTcjUUT/5B/bVt0u2OlzDV/HnPxf+lAW5PJEzpZRG1s3ljzNlIrpsR
         8qe2o0lkL9GLCHhoCa05LOKUQI3kBTpEh9h14u10jddBQ2KzR94y9GOaTr2w/kuDAx6s
         c3GDInvFIwMqNvwOJfPyCuYf6leDj15dm9qwpMhbbazAGXokyHNkL4qVCnRwe+ILYP45
         Wteg==
X-Forwarded-Encrypted: i=1; AJvYcCX0sX1G7dNEf7hAOPhMh3NdNlKPFdFwf5cC+Bdslnm+hlcpcTEeQGdIvsragt/8DwJ0S79Phab8UwpiTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv9tpv5ZGIjAd4PkWFUn/X4C6baCEt35M2VLiQJEWKfnSbGE8H
	Nxe96xdqcMiSTpJBg/qGO8JhN4Ls8nNgxxn0mphwHlbbTrI4QGM5kiNRMiLyW2G+zyvyKNnMUhj
	mG/A+e0oHtA7OQyDiwOLWcQ1mJ6e/yfLzLfVZbbDHdsJTXQkk0Yie6Zh7MDkEqebuCw==
X-Gm-Gg: AeBDieu4Ssv5xWI6BB1O3BexslR5iZOlKf30hIkv4oO+sHFzTPPEy1nr/6iMznuMmJC
	9503Wg5sT/2I5jFVyC1Zcno12W64DBKAeEu37EiVWcj0XwIhvA24x+m1oB1wpXPL4PVwa/L/dQH
	Uk+NMTMly4QvyRxdlf3o52pAToxGquKvmxv2rAxJnsp4fGSxe0Qqk7hrdfgWlwMHt9VVSk9diYs
	0qRj8uyhnHkCTRTC9z+8V9ZMdKwB9fSKa5hBXJIo7HKEaE1d0Hku09mrn/7Fvf4li9OrDsbAdDv
	m2pZQIFQ6Q3COA/slmTUUVPBOGmjaBFA59pitq8J6gplsCvjzQZAFsyo8FbxDvmBt4KXYAf4Ps1
	6TI+etzrV4EwtSpkqz3g6fShq3VsxjDLXKSNCKtffRNyrppEQIeYeFDccM2hlxsnfeZ6oVf23+N
	j4NG33cQ0FFY2m9/ZhtmX7N0NMn3tJdRvy2vQ=
X-Received: by 2002:a05:622a:4246:b0:509:44c3:5ffa with SMTP id d75a77b69052e-50d62b0a6d9mr116276341cf.52.1775336535674;
        Sat, 04 Apr 2026 14:02:15 -0700 (PDT)
X-Received: by 2002:a05:622a:4246:b0:509:44c3:5ffa with SMTP id d75a77b69052e-50d62b0a6d9mr116275831cf.52.1775336535152;
        Sat, 04 Apr 2026 14:02:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c95149sm2319838e87.5.2026.04.04.14.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:02:12 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:02:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Martinz <amartinz@shift.eco>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        Petr Hodina <petr.hodina@protonmail.com>,
        biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: sdm845-shift-axolotl: Correct
 touchscreen sleep state
Message-ID: <ehzmqowdrvzafwahiakegphhvdoewq7eag3obpozxr6xf336rr@skgsull5vtd6>
References: <20260403-oneplus-nfc-v3-0-fbdce57d63c1@ixit.cz>
 <20260403-oneplus-nfc-v3-3-fbdce57d63c1@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-oneplus-nfc-v3-3-fbdce57d63c1@ixit.cz>
X-Authority-Analysis: v=2.4 cv=ari/yCZV c=1 sm=1 tr=0 ts=69d17c58 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=_gdz5gggCwxQTVruBwIA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: msRVflEZMQtegmfezSYwpIO1FDkSqhND
X-Proofpoint-GUID: msRVflEZMQtegmfezSYwpIO1FDkSqhND
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMCBTYWx0ZWRfX63qmMkzCJhHu
 vUtnQLCENQj39X3Ha6WZwCi+7h7QsxmiY8Tn0AAAS37Qui12dR73qk8w4Mwr3E76prYtvVjITv8
 /dnmTY9+x7fDIMcYSlI4cVuLN0iIExHK7A2zXIGYI4NHUT1YBMqiEXVHvMMuBTsApacMilMSG+j
 moQY5eRaF2L2y7D3LkWdBaIQUk/JG4Nj+3p46FUm/Q/jlut0qqSRtrWvtFukMj9nNcFIHxfsS9Y
 /CUJMuzUdceJrMY22JBbLMd6RQc3JUmWBmdSoVFYWKKuwM0a8Zw/lT1ta4IvNY7ASW6nUCuPDnY
 /egFYRGkL6MLGhL4kPtd0/z/tlnEgcFSktWbtFTG4HkOKpG6uA2clPdkGR0Z+s/0+3DJuZm2BTX
 0P2SLSWwXd/T/43IhDWc9p4n1ixJ5dZ3FmLNsDS55Hf4b+JInn1CJP0mpduSTIFUTP/APdOm0Do
 WUN4ZedO97JWn5zMfJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040200

On Fri, Apr 03, 2026 at 03:58:48PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> There is no suspend state in the mainline kernel, use the sleep state
> intended for this purpose.
> 
> Fixes: 45882459159d ("arm64: dts: qcom: sdm845: add device tree for SHIFT6mq")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
