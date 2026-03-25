Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD9337AA88
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 22:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774478498; cv=none; b=VULdF5+lChBQgFDzJ/bEvVRWvYH8UKP9W5HkrRdOg4hiL/sNTv1rMBTEPtviCn6MIDxXywXvoFduHIGouL0NVcrJypxWImyF9xvTMFYdXkUqNmDVd6qfMagyXMOIxoycv5OmkF/16zMdPGRZV2Mr3Dn/nRXWqcakD64wDX42Krw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774478498; c=relaxed/simple;
	bh=reMknFJoiqNp4mtflM/9KnhX9fgjE3GRwZFkcGD+Fb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sj6NVP0aOrSHw516ajwQP/UGzECf+ffjYQ0sLVSMjQJ7hVu3bqPR2ZcUzv1uvX1lUtSMGC0tfDlnW3inEdeApaIU80ULSxMKpnKntk1fyJO1AGlvSkjngoS/dXDF6TaJI9EeQrreHJdyrYFLL7JNlL4DMEHva2/C8hSUpP4cKfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n01125Zb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IMYiB+qQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n01125Zb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IMYiB+qQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PLPDR61061708
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 22:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MskXGsEUY9X26Q4Lhi8JX7q2
	GLBZq1hRtzx+iwBExXA=; b=n01125ZbN+KnMlSr+OetFhmadiRmMt0bJWr64P00
	89KrmUqKceQyI3RUVdKojgF+ZgDVUui7OcFniBTrtD+Iz24GdHc7doAns7E9CiTk
	nt/KhkxExEhNozicRlFIC0CrkSuqG8Gsu7vWOUNpLejYRkOOmTQrdLwkDjN9igap
	iJK37cBClmOt7kgs6JvhImYfbIWAulo3li7Ybuh/sIlHxHs4gyz6n5zgGuu1kVTn
	hLC9y5iz2PoEWn5HEijPeBZTfS6P2YtgW2wAjE1zvAFpQAo+/++1MHyWBeDAvDP8
	+igEx5FTlJV9i26rCyMGYf8/R4y9/FH9XL6UIe5uJjmAfg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4qksr6da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 22:41:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091782ab06so20219981cf.0
        for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 15:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774478494; x=1775083294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MskXGsEUY9X26Q4Lhi8JX7q2GLBZq1hRtzx+iwBExXA=;
        b=IMYiB+qQ57eoKocLtiELbbp4jGW/ZGRka0bjB2CRoh093YghlQKq2cWOgmtlhLQE9Y
         kdmREAF3W+iigqOvD+RzUc87L6GIJ0W8IWSN6YyOz+yCm3qJVyEBDMpCpMorqG45kIrx
         pUYcZq/w5EIO3dmlXipZwBJOFG0OC8DAW87EEB3pZ52CA1kwmsxQl6D+VkaXyRpDBw/9
         b82EJEtvBlQ3Pom64I/my7z/UCvSN5vC/RHlZi2Nw8Kiyi82D1yvT88yA9GgfKSo8FXw
         S5HE+TvQ1Qgd6SQ/Es90ncOGcLPwUDdPw5e65uMLEeovMHs2K6PmuVD9xF3VLXOxxhJN
         ip3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774478494; x=1775083294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MskXGsEUY9X26Q4Lhi8JX7q2GLBZq1hRtzx+iwBExXA=;
        b=G2qZRn0qd6zu9K7tOxuD8qdw6VMlI9ZRMQLQKmXSEd80eH/GrSwgfPg1SfCpOR5XHG
         xoNVz9boLng4NlZATHx4dI0U8S4MZ/x/Fp8AUZk5EM7eflgYlz8/kYZznYigydKxSIjb
         er29mOtahgzxsUBvO/8cKEgGcjjNin+rRoxtAdkvT/W4Hh+gBkYo1V4oI+0wROBgNFhR
         eO6jMQyIxxaFwSewtzEQCZlY2GbC7W/ppNI38SSQaeyila5+052GJVbv4zss+Bu3Ty2N
         jHfX31jcvcecS9hiCUB8AmSmz89qEZ5eow8IHOmda5FskcgTw/IYnXTTfaEiiJ5dywQZ
         eVTA==
X-Forwarded-Encrypted: i=1; AJvYcCVzVQcQ/vOLu0D2JLaVWb96dc0hP0fAe9O6C+KW2ZFj3E3aOlqJMqijXnnpYAl8X9ZyiZvWK0EfXCZCSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqCvZl8QaeqrSX873AF+Nuwk2fGEraAE6C9aRoWhLTkN0yQ8IG
	VAAOdm4cRsYdoL71/9+BY+SGMVjoiqxJ8uXMbl2siLlXOwQBS+M4hrg+zLlnVo2hljoa7h/GE6N
	6uRU55IqkWckw+7H7NED2aqd12Gz02xuhSNNeSHvkDgCQs6M4Ko0Kc5LkOH1yuC9fLQ==
X-Gm-Gg: ATEYQzxa8izI5aA9Xy+0oLJCbylVGLhbf6cx5BYwKuycLTOTLatjzqZ1I39BfxZEAEE
	hh++auyFaij0RrRoEgvi97t4VQFAuo7A4CZg6A1YCPSSI5GcamPj3Hb/UPxmuMzPMQGA36gzreG
	BCKKcri7G7Gudy1Dl+dGwLYQETWN+o0OIzx9wI2mYyRgrB9Y79Le/oT/jxCIbAkwhr6TMWSJ0tw
	A5Av8pL9dPA1ejlF63j1TdoDDQ1lPIqiqGChbsk5FGtL2HatYXpaZfom553Y6zCBIx7BBuokO7u
	Ofz2PwTeeurSM8MkS2aI8HVoAxbnwxSIS4XZ2+T+vEuyAePXEFM12C/DOfn9P2FLnik8lCOoFg9
	nWtNwRX4v4Wmogk0Vi3h6YdleBShNIhyvLLuh4CiwLVV1Buu5ZksFP750CWL5im8YYUYo4k9Wda
	lGdQl3CJOVV07J578r/K/tFV0RNoVf4YgYPEY=
X-Received: by 2002:a05:622a:424b:b0:50b:4ec8:9e66 with SMTP id d75a77b69052e-50b80cf1693mr79553911cf.16.1774478494523;
        Wed, 25 Mar 2026 15:41:34 -0700 (PDT)
X-Received: by 2002:a05:622a:424b:b0:50b:4ec8:9e66 with SMTP id d75a77b69052e-50b80cf1693mr79553741cf.16.1774478494141;
        Wed, 25 Mar 2026 15:41:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a064534dsm171727e87.18.2026.03.25.15.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:41:31 -0700 (PDT)
Date: Thu, 26 Mar 2026 00:41:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm6125: Use 64 bit addressing
Message-ID: <yfm36fgq3muz6cw2bizgg3h7bejq2tj7sxjeorhoi7tafbnnjl@qeipinzvbpkv>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-6-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-6-446c6e865ad6@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE2OCBTYWx0ZWRfX0P9Gw2nB1Hf0
 65V8SgIkB65hW1GytR1NAq8exBK04vLyuI3ly+z9asZ+OYErTC+0lHmYzk98Sm5xbAgOIw5F/me
 msQsWPW9YCbnuHVTXWka+euGbiF4KWyrxzaVN5nQjOt5cH3OnDfgv1FlHk1XiyGFR9XWDu8JaRn
 TOSulNoQPVAVon4QT6jZjfyX4ho6qABFiAt3NWn0P+Vw5wo6TRKGlVgwcKhYHuPM8AXGriHBDpb
 zkjJRV6aHbIxEY2Hc/7wZrflhX1j6Wuuwk+uIsecey2xwbQvPpqnQfOYVokJUQ21ZwEvrQm39Mi
 R/fBViVFNzepP0XcwLkk9JWqAnwUA+t9ZOFZ4NNlVGyhfZSVEKWjyOQzWq+yvsgkh1n/AZCUvN8
 aF29IrLHeMYm8tnkzyLpVkcuO8f4NnYcC0lI+G5f+UTLFghssiOhwjotCS55K4n3lxzpm0PbJLM
 v9SRQKHA5VFUq+Xum+g==
X-Proofpoint-ORIG-GUID: cdkkus_qPhHYaUQTu1sOCqJM6oAYyqHZ
X-Authority-Analysis: v=2.4 cv=eOMeTXp1 c=1 sm=1 tr=0 ts=69c4649f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=3mFuQuvshfmmPt20Ni8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: cdkkus_qPhHYaUQTu1sOCqJM6oAYyqHZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_06,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250168

On Wed, Mar 25, 2026 at 06:07:29PM +0000, Biswapriyo Nath wrote:
> SM6125's SMMU uses 36bit VAs, which is a good indicator that we
> should increase (dma-)ranges - and by extension #address- and
>  #size-cells to prevent things from getting lost in translation
> (both literally and figuratively). Do so.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603141433.MDqfoVHn-lkp@intel.com/

Missing Fixes, cc:stable. Also please pull to the first place in the
series.

> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 153 ++++++++++++++++++-----------------
>  1 file changed, 78 insertions(+), 75 deletions(-)
> 

-- 
With best wishes
Dmitry
