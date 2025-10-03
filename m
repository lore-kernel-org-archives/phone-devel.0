Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9655426C393
	for <phone-devel@vger.kernel.org>; Fri,  3 Oct 2025 21:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759528259; cv=none; b=EBTsPi92aqnxd8DMrfvCvXt4xZMeWM/44WqdSchJskuP/+XRSfJZCH0KIUK9+cAUN6i4zQKL1pqZNj1m0yQCmLNgSx9rYaNZ6utJSe3m86JymdQcgSBEzOHN6RrUI3QOQXXcI0gmeLyAflxKLO0w35m6Zs/wq6sptcgviqL0BdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759528259; c=relaxed/simple;
	bh=2+Qx4TvvkyhDYLhaS2hPHaAOwTarJmhD8/45A6LfgP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvYhz3FTinRRoKyDobcqdzg5rnMgJ3Q14vdEDkDyjKliak/hmUao4fPxD84ljEKpj2xwSmUVxTRxFZOYZj+a0wFRXsO/Z/dg6+sBbbZCRleN17+hg9eourPvM6I6c0MkfpXbF04tQbHyfTBXBfySqMxNrlPihVz0HSFBRGT+hT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eqm3RKvr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eqm3RKvr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593CHBG9016176
	for <phone-devel@vger.kernel.org>; Fri, 3 Oct 2025 21:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dMwDleF2rEGTBFbEEiU5Yhas
	7ke7oirsC8DK/6N2dXI=; b=eqm3RKvr7KraUO4Rza3bsiOE5tvK2i/tL19oyWFK
	cFUle3SSZ1YXnvej7kY95+vF+jfZmoDOMJClzxyFUzQsprU45zNmjzs2rC28sH5f
	4nG+Lt18CthRMhpVft6tbgW/mw1T7AvHRFk4oLbdauxDPdaOU/zG0/vjHouNG6AU
	mFdysk9RQjva8InOKND4/wJgiwvEPPfLcBjEBTKnFxfwSWlwmpIRUhJtWt85JR2p
	Nmn2ft0C0oOwryGjzCE8kE8vA+E8RCEEelh5ZShH8MmMmZeMN441bHUAoKbSCbOq
	DYPuGgodnhVhTLgyqu/+1sLHK11NB29isYOhKUdP+860RQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jeb7hadp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 03 Oct 2025 21:50:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4df7cdf22cbso97670481cf.0
        for <phone-devel@vger.kernel.org>; Fri, 03 Oct 2025 14:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759528256; x=1760133056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMwDleF2rEGTBFbEEiU5Yhas7ke7oirsC8DK/6N2dXI=;
        b=TjpFEe7PVoX1YQ3w8m+3UfphldeCcDpoBhbNEPpCOs0MZ8gsVS3HTkd04rOtX0APz4
         qdcwHoG6M41zBYRHyCHgjCv5wmlucNRF2G3y5R461Gw9N0A4K35CVfvFOhGLselzIpa0
         r6x5kWTTnM7BzO7XrrkSwhM5da20ohfIJ3U7FulraUWX0G1Z4F5UGRvhZ4iHuXz9YqDp
         jTjZmtb5opHRwVht0x/GEh5+Pqdrw4sU778+2tL9JGCHwHAyOqSjpuHlmsmhi4C1jy1/
         zS1mcPSS++x9NbhG8vxlGdUKV5P42A4eRvUYm6BqKNwpSt1PVCa/UpS9/YG9bop4hNZZ
         nGlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlqtQPGwXYt7Wm99+ECYdVLzL6b2S0gTn35Y7j4F2ys84TSs7bGD+3hOYJM6PC1TLX/PtN+HmtBj/b/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe7OBEsQHBxzWAZwWuL3sk9Zj6ZaoS1dalIIFa6Sub4+HKIv9E
	tCSuzLRrCKeLPijChDA90lNjO5XJ140otcOacoYx5hfeLfOvGl7SAdXJVjofgVklV/04UpJzBM/
	ThF2PKDlvNb5F1wU66fpU1LnbizZIcnJ/InKL/9JHPFsRNf+n8bQCY6Hr9XKuRbv1uQ==
X-Gm-Gg: ASbGnctEIOhi/DNSJ+5Lzvk7Q1vNLxlEGrIp3Z8g9S/i+E7B7ywDTw8bD9Y1NZz+Xip
	/WH5PYWfUmMkm+4r0dN1Mpax2/0qa3qHUx47YIiquEHR6gv5+8rwkfqIW9BCfZqdP/b+kEyKnf4
	V5O74Cor6i0riyzu1JZnHllxJdgQX3f4ipGFaATDN0qH18rwMbkD8gk7KNIvEhrByGowwTX4Fie
	jBQHgNvxtZf8f7Zw7nFzRg+L8Okj50Y71ZjDfNYuNTh/fQ2++f5CJtnW8UDUeejz2Jl1sd8u0em
	GOl7TdTlq0Dy3+THg2MSdm1hIgJLv7EAsu+ZvHvoXARWwV+Bwo/3ankCw7WgRlg/7d7pnbe1g+b
	dBnIou5tHnEb/rmS/D+k1loPBflctksN4JqeWtnjD6o706oan6EyV1HYclw==
X-Received: by 2002:ac8:5952:0:b0:4b4:9531:8a8a with SMTP id d75a77b69052e-4e563b6866cmr113183471cf.38.1759528256486;
        Fri, 03 Oct 2025 14:50:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi4tK4Ey95PC2GedwCZ2MhCcVKB0hyCtFcuRedprkbRea3U2e1PifERn9nC1Yryiua1m/vKg==
X-Received: by 2002:ac8:5952:0:b0:4b4:9531:8a8a with SMTP id d75a77b69052e-4e563b6866cmr113183211cf.38.1759528255910;
        Fri, 03 Oct 2025 14:50:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d6f3sm2197351e87.77.2025.10.03.14.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 14:50:54 -0700 (PDT)
Date: Sat, 4 Oct 2025 00:50:51 +0300
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
Subject: Re: [PATCH v3 10/11] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
Message-ID: <mtz4owbmukfo2zkgkzjckkisy52trmimlmy3kfngg2n3ej45c7@crkidtvm6o26>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-10-b14cf9e9a928@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928-judyln-dts-v3-10-b14cf9e9a928@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAzMDA5OSBTYWx0ZWRfXwgUoJUXpzsGs
 JOeOE/aLPA7ibJlI3ERWPLtGnPyRjlhZgD8GFpZt4IIa7Z3EGkWmSgOdYlSRWL4BRWufj4JL/Me
 3zPBpDgaLoJaDGWwsE27Uat9CApB7qI5RNqJjLziyLG3VtumA39ZfAYNvdSd9IO7FRNeSeLn7B6
 8gX6IkXHMjVSi4UVwWX8tSD8KZlsTITD2gJPpufCGkiltCcA86JOmGi0jMALEhzM+nvEXuUKA8Q
 J2bOV+YUeUX/yqBF11LXVgt1klmbqHGEf066gxflDyCQHRTprG9PuQI+1Aro+Wj7f6S58pBGbHd
 q85EckX4qqrzWw6en4MPxUrD2ZWck68CY1zicux1DVBWcbmCgnWBjhu9a1olIwQpEPb+JlpXTIN
 iOADJoVO9xKOq//ZzKYwyTof0nlEzQ==
X-Proofpoint-GUID: XbT1IPaMlLSYHzLsmD5pFRIh_PGjiHB-
X-Proofpoint-ORIG-GUID: XbT1IPaMlLSYHzLsmD5pFRIh_PGjiHB-
X-Authority-Analysis: v=2.4 cv=YrwChoYX c=1 sm=1 tr=0 ts=68e04541 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=Gbw9aFdXAAAA:8 a=DjAeRk3aBtCqIWsq8ncA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510030099

On Sun, Sep 28, 2025 at 10:05:33PM -0700, Paul Sajna wrote:
> These regulators seemingly help the lcd to work better

What does it mean? Also are they board-specific or should they be a part
of lg-common?

> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

-- 
With best wishes
Dmitry
