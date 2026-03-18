Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B003DC4D6
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 14:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844903; cv=none; b=e+gKtYAswb5F+MaFSwW9YZdf+CaSarItYxBKNMzWAvi/qgz+BwxIp3ohw70nLX/U2eg0vTXUrcDnh27HyGl7dzPMoJxmKoVad1u+YTwA41P7XKcTnHXHIee7Gvg+ctcTHFINAYxmbmtbwZ2j9YEaUVlwpbXqfdpPhpZhzY7ms5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844903; c=relaxed/simple;
	bh=zHb3ug56yZU73Rkgye6tWFqmIizXoa0cJ4zJJ1kdtvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JyaWGEWg4BVm9rxbkVkf5pEq1F+srJYKnzjWUsNZEsDBKCi9jRzDt051tGto1dU6R4eAqZQYqnnhSgnUtxkizSbWkNSkXAcdjWkLQfF/hqzxSP8CKYi351bfLO8Pc8mhfQXMnqbJj8BSAZwW1uViNjmJsr8/0dxmkm7czfWZ07Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BwH0apbN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QOufNLMr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BwH0apbN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QOufNLMr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IEYuxk1050235
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 14:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oZ2ZDPsufRW4dhlt63DbVB9l
	96Wxnp3DFYqHb0H8STw=; b=BwH0apbN2Gs16TLoHjhsKUuI6hR5HPcsS4dUKjSt
	bFpevIdMrDvVag3Z/61AkghHoS3DJmZpGe3mOuf36XekOiAgJkqsKkpbLC/NiSDe
	SSRzXN8QFbcG5xcvzG/uBAVWf0M764frMiQxQWtvQXcv5080qUxmm29cVDOPhESe
	HZAFK8pf5YbCIu7EWioZCh2r94lj7yFx533QlCeU/Ew2BFt7vCltCfJw6xIRlE2Z
	HjjxkSCXazniN+o5P3kEGfHwjLrvB0aghVLfvXuB7uvIL+MDiHD6X3d65eP104n+
	Gwg6iFYf+3Kqblgem+4E3AFEq9F763pek2gSaLEoltgKFQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4ejxt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 14:41:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50937cf66b5so1044138591cf.3
        for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 07:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773844901; x=1774449701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oZ2ZDPsufRW4dhlt63DbVB9l96Wxnp3DFYqHb0H8STw=;
        b=QOufNLMruF/p5j6QI8wh2SPNuvkfRZTxLMhzzZvZif7G4ogtllVnzAxwJc5LpKpPmk
         l+8ncullRTW3vXafvk/KVgrRs9uqAJl8sbXEEK7DTMg+WWVuREiOlXIkI53BDOCGGDVm
         WSmlsD8Z9vZqz7c+6KKy+rc+3fO5UoOmLtHtBEJm7PggC4PZSE4ZXUeySlTEHYCR0UMD
         ar7H7D3XZoGwihzjAqLWfpjqedevGRpOFx9sNBL5VJm6PKQdgDXisIkavVzDhy1kxuNE
         TXMOPYzlZX+xjpa+uHXRtpctBGZ3d41Lm7+cuOUagTU2en9l1iQvxZ3EEeiYJJPyKk4D
         JaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844901; x=1774449701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZ2ZDPsufRW4dhlt63DbVB9l96Wxnp3DFYqHb0H8STw=;
        b=gw4n0AHmhjYcUswOu33ZVnIpp4Atx8cBjEq6YyiIr8fru4O+gUNETFoAgEobLFMwsK
         5k6FiWwBMhikfgfMqZeGrlSVEU0L0SF3QohSkKaU1EwclePhfZNMEfzkJCw6i7PiZjNm
         KeldF5NjGUrDIinOBiW/dLD+vRMrCxJKwZxUEd4dLKUjFg0toxd3O2BKIeNTn4GpdfV4
         yMb8b3+cRX+3YqYhtlNVMTgccvKaYCOir0p4St8lpq9eXhbWSAj8JwN1apFF8nwNhTO6
         sYNxeW1xSbnrcirmYwjW8cOQy46JI1k54xv6rUL/7guRZJXqnYkQHuQM3wpvhYO7lrGX
         aecw==
X-Forwarded-Encrypted: i=1; AJvYcCXlZRhSW9CYb5RJ+2NXzBYIqUrbnI0FjEPsa250IV9Az1LFU6Ped65vAhnx/K5fHCu1axOzepzDD7dC6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbXgSxz8AjwPWTU0COLIEDbn4bZoJmwc4XCoARIYSGrYTG3+eT
	Fiy+Tbe5Nln3XCg/nw2M4sQEF+4FVMs0qo/wUrpAG2EJYMMzeb3JR5k+Hc7GksfwHN74BU6z/iz
	ipCrt1VN5o5Sjbb7jPBulc/ycV+OMN/RknOMHbOYLKYLAb7ivKtg5bgZ2ZdOgEv92tA==
X-Gm-Gg: ATEYQzyItGSR0fwNGgd+EOyD6f3yhCZ/tqPzz4HXhTIDPFyT+ynB5C+pYhffIrlRzJQ
	+pEltHzN9kqY5cpK7pDcxWX+3QdFqHacfl6nMxGwB98odaJe9kvINNOD2wEKw4vwmzDgUJjLkPQ
	Kc9P5JiBBYBqcEmQGBXgROZf3Dx31g1qg1JYEq5dWWpEecCvE+QiHuHSDvtTokotUnKIChf3lMa
	kRj29k1kpQ+REAFNMC+fivEqWFgz3j0rtG1NY7jrN5o3hiPBaWznXa+iAJ2I8QT4KJJZ23nNcqS
	3zSGvIq/DMbXX61zuMXfW9sKX+XWTG4PzcSuxQ3VQTPDmxhXovLa4WkZLPKZqAC+xHlkFCu79EC
	flhbwBKdfbgMXXHM2PI464PWpYwTnB76qLd1VwaE7cOOfuNfUn4kMWh3mjoqusOH6dHEMCmzsQB
	YLbG/WwwaKbDJzFjNynL1HvnTpQdZ/8wwagOs=
X-Received: by 2002:ac8:1205:0:b0:50b:1ecb:36ff with SMTP id d75a77b69052e-50b1ecb3a94mr12587211cf.49.1773844901088;
        Wed, 18 Mar 2026 07:41:41 -0700 (PDT)
X-Received: by 2002:ac8:1205:0:b0:50b:1ecb:36ff with SMTP id d75a77b69052e-50b1ecb3a94mr12584581cf.49.1773844895890;
        Wed, 18 Mar 2026 07:41:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd54dbf75sm6008391fa.37.2026.03.18.07.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 07:41:34 -0700 (PDT)
Date: Wed, 18 Mar 2026 16:41:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sam Day <me@samcday.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Petr Hodina <petr.hodina@protonmail.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: sdm845-oneplus: Drop address
 from framebuffer node
Message-ID: <rkbfjg77rrz4nfjxlx5tmqh7tdy6l7s7i63puwk6x27s6c54x3@ryid5gnvodrk>
References: <20260317-beryllium-fb-v2-0-36b69dfb760c@ixit.cz>
 <20260317-beryllium-fb-v2-2-36b69dfb760c@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-beryllium-fb-v2-2-36b69dfb760c@ixit.cz>
X-Authority-Analysis: v=2.4 cv=T4+BjvKQ c=1 sm=1 tr=0 ts=69bab9a6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=m8ah2Tg14k2Pfi5VopQA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEyNSBTYWx0ZWRfX2HfDPBtDJLTA
 /sWI70Fr42kgbo8DurejTbMy2c9Ih/cWmGM/AGYBfvdweCV2d0pR96eOKgd1a0CvnYsBtTJu4RE
 76zYORw0h47Ujy3DgEV68iii+eGX+u6c8U41Qa2HDKT5Bkfc028Q0r9kFeva/qXPggs5M+L/bSE
 AhT3N5VyO7E2pqOGDa0ju9QvkCYexaR0b4G40kuqRDqr305cqPfjfmIwdVL3fK0UDqKSqaeXUcl
 bxPRS1YU1hKqcJCUfhjmOK+hTQk7My41KcPN0Q/baMuY4THaaSs8vxDLdFzwBzQqMCjZ0EflMl4
 ZXUgNe74voUVAwcJ0SWrFzhqQENHhyUQaauRrCzXD4hYA3b7mF3oBD9s9cBGV6l6uBj3Ji62ppu
 Gqz5R04Cdo53Gpa5gCLclfkNv0CwwjvuL0PcZz4La2S5erdLALfK90SPj9g2ol6ZZf6JvveT3XJ
 2PNojBEFFH6IyqNsibw==
X-Proofpoint-GUID: amF76yCWfzHOmnGlmmBB5RFjMvBw4irN
X-Proofpoint-ORIG-GUID: amF76yCWfzHOmnGlmmBB5RFjMvBw4irN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180125

On Tue, Mar 17, 2026 at 11:12:32PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> This node has no 'reg' property, so it shouldn't have a unit address
> (after '@') either
> 
> Fixes: b0d5c96e860c ("arm64: dts: qcom: sdm845-oneplus: Add framebuffer")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
