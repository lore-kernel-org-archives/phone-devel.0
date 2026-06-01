Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12C436CE03
	for <phone-devel@vger.kernel.org>; Mon,  1 Jun 2026 11:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313835; cv=none; b=Ru6PnDpOTyLc9hR2ld+8XJalhUDex+4Pi5TDrE57MnWBQwt7Gkn9f14dFuP+KNMSedIt4tJRBAV28jzsXNFT2y0lsfVq9eeZ4jOPnYVxLO1ZCjGSSI+N6miPj7VRFn28Ph2lCCF5JqjwheUqUDsREifUzwvjvTtyBaqVJmHn7rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313835; c=relaxed/simple;
	bh=NZbzVWaVHiBF3W8uLPaqkX/feD3/s0YkOgd+u/PTLKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yq4zxHdJJZHLS+RgH9xLVmpgsTEo/SFQuECggXCRZuI/p8025HJUPNhjLomK4O0i88edmRxsib1KCjNoPZcixoYdBc02wSMrJHZ9v3z5GZRYU36f4sIznh7VSFD0T4o/eeaznePZssLu7OB+47bWOvDwohvL6dwQlofZ8goJcnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+FWiXti; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DkzRIEio; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+FWiXti";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DkzRIEio"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651BLwEJ621967
	for <phone-devel@vger.kernel.org>; Mon, 1 Jun 2026 11:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=55EtMKRRw0JSC7C5W8hcUBkY
	QcZqMU8GZLRoMMfIUyc=; b=E+FWiXtiyEDBNgeuivCmC0MoXDMGmhPHFryw2M6l
	Bnp+oLRv1Gq0W9YYuJi5cvsK47kcAMoWwDGPhwEslHu8dvvy5oVbwrlaxzSne6Gh
	FSNj62jS8ZtSKUPTxM4kDlVHl5GgpfiM4t2Rr/ypZAdt9R3oOk45pMiqLBnNj9cq
	W6vEGdH4Rhomz8nznJhycFt5yfPAYAslH81/LJtW5NcHK+vuChxL5kN3RM4AswCZ
	yvfd1nW3GRIpqVGQSTXzCfxjqOH3u2bC8xApCUDTi/HqfPvvN6rBbT6BoqaAjlYJ
	yZgnX1Wqb/1hz3TjwneCj55SyOfMA6e/U3AaS+Z8UO1djA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh954g229-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 01 Jun 2026 11:37:10 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9639fa7f2a7so718200241.3
        for <phone-devel@vger.kernel.org>; Mon, 01 Jun 2026 04:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780313830; x=1780918630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=55EtMKRRw0JSC7C5W8hcUBkYQcZqMU8GZLRoMMfIUyc=;
        b=DkzRIEioHQo+emvZ2GYzM1JzevDeKiIVDCV39nSprzy/kAl1ISV1bl/b4QC6ea0H9+
         IHI0terjJjv6Q3M2LzR0MHDdKQW9qM5TaQPosW4E4QOCYho/+AYvxXziId4RqaE/I79A
         hOT6g+hFp4yczZCYLsaS2jkwtvlXUrg0i2Xzfh54v7SVErkcjuzzMah7p7T5zUCT3kwI
         lNpG/1pFou3dnAM5I085QDbcOSozbeDJJAqv6TaoMwzAB/fOpioIPU9o3KNx5WFPiamk
         99IxBRCEGwMSUrGvd4v1uMFklHE5NUIA8dywHNft0CBaxBYPSECYmvgBch85TCzYSBka
         UL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313830; x=1780918630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55EtMKRRw0JSC7C5W8hcUBkYQcZqMU8GZLRoMMfIUyc=;
        b=oZ4VFqxaPRE0OL43patSnvTmrGmneZGVuOjd2MylGqS1n+mWqOGsqZK59sYcS/8qD8
         YDNZca2QC/bo8ENeMSnw2JSFLQEmYDk0T3B1PJ9lRgAYXx6R9HlQ5SRB9zOkMwUuRKRG
         O2HeacSpqQCqLHiSUvTygNu/FVpRM0xn+Hkpyd8TrlGoI1Y5Jw5UkoCACJ3T08xK+wzc
         tTncGaFHxyzCTuKBeFc/7ahB2wsJD0cc0uzxR4xo5S4pnHmnQX4ujtpqh2S/SxucHPy1
         5GVIuF0zrBwqzhqzD6wTlk4OT5ewyUqQ9+RdooZTZW5QR0kMcTHnkgDt2apgM5FW7ni1
         W47w==
X-Forwarded-Encrypted: i=1; AFNElJ8XUHXSEgN4zK+oCJkQi+0tuywnoWkRAqDU/pUusM3sm3oMCMLWSsWfs+FDtiNZtMac9GD5oJ03y7e30w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2RtVateD+uUZw7iiRldW1Q5kfThFRtw/YzHfagD1dRBSpEYCc
	3wncLEoolW79U4cpXEM8VPXdnYN92oy7GiqlG5mQuXfZm9vSJeaTVILvUgIFdOeGJnNh9MqNW0f
	pzqTsW2jo5uYXWs5BbtBTeUUKj/t3l6tmUVDkDokTCqlmALqdoeTQ5HeS1nmlV7xnPQ==
X-Gm-Gg: Acq92OHHLYFc+7GZL+ol5WzRF3hPecWNCsvakOfA4d1HLBLmLSxfroyqXLdwmRilERQ
	ggTERHYsRpCvhpZnPjWEH2/f4ZJga+2k3drKwaiuWbH6yNp0K7uMvzPNbDr6aQRHhwXfLPkPJqa
	5ylDX095JFvtDvqNg8F35/nkrDR1EQlZ4lzX077hopTwoKKeTD6La85UxHv+INXEbDzSdWccqCQ
	82UQbZyjLHtc9YnNGeTh3hjtm3Vy918St8drc+dO6XOwnE2WsqFJLkFzw7gdppTiNQYhKEVKEZa
	tn0kEmK6XmYUaQ2WzF0cdgV9msRKkgcWAVZORLPjVHlVq4eUjk0+NQ19uRo78TioS2UCJFw+aZW
	qolO5NebeiKyxC0/OZft28ED/NCrTLLSglaAW/+5MfDiB3NKe80ix2H8ep26nL6IJ1gciiH8hXw
	Xu1Y/laMvVX7WOONy0SSIFg2oH7ZGIHjEuwwnTQhmn6l/fNA==
X-Received: by 2002:a05:6122:d82:b0:588:c9a6:2807 with SMTP id 71dfb90a1353d-59bf46458d3mr3866829e0c.10.1780313829790;
        Mon, 01 Jun 2026 04:37:09 -0700 (PDT)
X-Received: by 2002:a05:6122:d82:b0:588:c9a6:2807 with SMTP id 71dfb90a1353d-59bf46458d3mr3866783e0c.10.1780313829350;
        Mon, 01 Jun 2026 04:37:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa631c7e9bsm1494523e87.16.2026.06.01.04.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:37:08 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:37:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux@smankusors.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH v3 04/10] clk: qcom: clk-rpm: add msm8960 compatible
Message-ID: <ckxvmbz2rmel6etaqyzdt7mt4ijdbehqp2sg3pggcdo3hf5qcb@z3vkzqaby2rt>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-4-fec6ac8dba02@smankusors.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-msm8960-wifi-v3-4-fec6ac8dba02@smankusors.com>
X-Proofpoint-ORIG-GUID: y7A4F2Bhp-M8GJ6xEb3gvFi3V4PQB33T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExNyBTYWx0ZWRfX+fyUlxeXiTm8
 oK11nwpjVMVV2Ay0g3nRXhrvJCKeafbbZBAiMKgUvjouRBdr95gBx4gFCQ2NVHVk06COdLhsPcw
 2MCscEYjW76uaZKS44dNsLkTIempQ7vVS69mKXBBvpMuKYzakioBwXD+4e2DOQHS3KzVu5E5abJ
 UEdO9OpUc/knqizKJaM4MRihZ/NW+wTpaVVnksSQWdvxY1BWbdRlimvnG1sn8pZC5oPX6eF/l0x
 a0oMWjsT9S/bjRRWFsjAvfGSr5SyhymkOmGJ2VT9Fwc3y3o+V6Cl5CKRzFAdR6vDnzF2KRkry8V
 mvJkRmi+AT+5Y9LyQjoeQ4zI8+h14Mbau7/EDJbTI7ct7ugRao+dm3IdaF2eA4mnxi9XJY+0t5U
 E4AOfdV5ZUcgwPn1b+vzvPBf2ptYyusNRwPsk+/Cx29zIUL0IGyQaDvo0d35CsVPIUhO2ej5f87
 3luUczE6poeo7pMvYXA==
X-Proofpoint-GUID: y7A4F2Bhp-M8GJ6xEb3gvFi3V4PQB33T
X-Authority-Analysis: v=2.4 cv=VpcTxe2n c=1 sm=1 tr=0 ts=6a1d6ee6 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=wxLWbCv9AAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=5PoCL-xiRuW4qANWJgcA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010117

On Mon, Jun 01, 2026 at 03:51:17PM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add support for the "qcom,rpmcc-msm8960" compatible string to the
> RPM clock driver.
> 
> msm8960 uses the same RPM clock descriptions as apq8064, so reuse
> rpm_clk_apq8064 for this compatible.

Nit: if the series will be resent, please consider adding something
like:

Although the platforms might need SoC specific quirks or features.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  drivers/clk/qcom/clk-rpm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

-- 
With best wishes
Dmitry
