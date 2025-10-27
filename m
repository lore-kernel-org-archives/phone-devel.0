Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED781305E3F
	for <phone-devel@vger.kernel.org>; Mon, 27 Oct 2025 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761575059; cv=none; b=RI/t1cqswpwy5zMSWYW4TTCQA+BpkBV4kJ0Bc5ScwXqhzya9xHV5B5Tnp+2TB6l1oOKU2lx3LHjbPuFAfDVDNLWf+DdMUB3vMjJJ17rFZtMdsFsCWZkokxkdCyfM4ZJzZDR3FFpNFxkDxjkNSTDvCPpyPQAXOJCDERW6m8mdWNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761575059; c=relaxed/simple;
	bh=E6e2JqYmubVVoTDNvWKRmNqekD7fmAvqw30dUrKfXwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTjt6OP1lOXAFAdPHLmyxTjQXlu5pgkn16SqXCoHRDwICj7x2Wni2E/Zvx7NrboI3TcCE+xFwZOOuqcP4TRTlbE+Lzdc1iD1Y1R1nOVjes/Nxz6DynPXyCdvCK7CxDem+5WlTzb2m8jrERFDB3X/vsZevr15+6CNEA7fMUt9/MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IgWOyT3I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IgWOyT3I"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RE4W7q3018367
	for <phone-devel@vger.kernel.org>; Mon, 27 Oct 2025 14:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z22q11bJjODxBoHmYKUh4Hk9
	cf6IJGKHIianKI9ipUY=; b=IgWOyT3IN8iuBQVuTPSWo9K6Tf208zO9kvOf4adB
	UToFUTwzGTlrjU5UB526DTG2nFzeOSCjkiGNtZnNj4e6LJ4rZ5mSNC6QztUtFaEf
	Edmo4Z1QU11fLYwU+se2aRcon45fGDI511m3erRxjdLW/qpahw+tgJsxfVQ1Blvu
	BIMwYIi2wS8ahyoObhGc/6NRVnRZtQhALrXDOL7VNHae6mEEN1yFdWpumWSGV/2y
	cO4oy1zkIKB3h5+G8utP0k+USpd0WeOuEjjKveWGMkxwR2Vhr2GBuyklVOmw6VFm
	k0VuXFDwnNnfjinAuWzmERHiCsfm6ahMmVz0rkBoJFTd6A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2a6a82ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 27 Oct 2025 14:24:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ecf1b7686cso43435021cf.0
        for <phone-devel@vger.kernel.org>; Mon, 27 Oct 2025 07:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761575056; x=1762179856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z22q11bJjODxBoHmYKUh4Hk9cf6IJGKHIianKI9ipUY=;
        b=VAM6lEMoC0GVRUo8ITtF2odnn/v0zN6N2zDp+BuZzorxcNHsey60MYVsgd2p/xlurc
         Mi0liPhbN+bnCW6GUXGG5ss5l+jlKzPzhGLKCSsub5M3InwNUhkvYDYhIgLLEcbh609A
         H8bwrsZpPhTrKTFPi7YhSkLY5+Ot231c+uxlf9s+nJ/nV3IHBRSCS+HZf/SaBl0z2RRm
         5aYSOGlOAxFOa6j+Qeen2jjtwMU/UHvah7SytryKTLMWSwQ1wA8jI1HbFWCiJ4hMWRnp
         lxL4dZ6WF1VIb8XJv/G77vkWLKURdTGR1AhWbPu/I+bG8CRppAXP5hTAV6y1/WJguybT
         1PxQ==
X-Forwarded-Encrypted: i=1; AJvYcCURz5KVcqtmQPujlEZZIJzTLwlulMDSDewQstiYOBOTDai2fUHMLDIZ1k8ve95WSd9AkmRgvltSbY/Yxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YymHYNE5v7RpkVACjCEAS1paRxMueaA09iYDR73Dds3LfMpAv6p
	h5rXxQS0sXs0wXxPJzjH0z4Qsdglf3cVLtLeVzyFGG4MG675m+KmSB7hT3MxWdDMRfwERXmTNRE
	sLQ0afsSsEZhWZ+C3HhntK2vIxH6FXZkKR6W6bGDwlvfCxiNXY5DsgGGkHCkFz1uZEQ==
X-Gm-Gg: ASbGnctn9w2x50jR0hGyt+y5lY7aL/IZe3LUB42wnXRk2BNUii6Nc7LjfeSZQsQxVIm
	T4WV7szZV0LCDYYqo28QWNDAi21pGRjkXoB6w1TaZFQ8mXMpObd3UQxIgt5Gv2yZ3jvDFVGblPn
	k7uMw5oGrWyca73QlnclQSu3fZF3Qxsz1ccWjzlVnBPv6szon0ko2u1JvVK0VQ0o+X81f4X7CY+
	c+qOBDVuHAmgj09/NYq8M2BZAv7bZkcz8IjHYaIsD0LW2R0o6OH+N1qt5Dmq/M23LAdCVJuM3OH
	FcldpaIdTksF1sXKkTSFLeIePUKz4qcUk5BsQu7G5Ook7fpwpehGhrRFH+tx/DAkKyhMGZyFiED
	bvDlax0EyTK0/+R9qKIcWjh2jjVjM04mT3YmMAdDLJPozecNgiKRpMp7m1CIarrmjNwG2SXgQky
	Oiax3dqnjobIb2
X-Received: by 2002:ac8:5ac2:0:b0:4b4:906b:d05d with SMTP id d75a77b69052e-4eb92c5efbfmr144865321cf.29.1761575055881;
        Mon, 27 Oct 2025 07:24:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHedx+dtjFeyY8ERWvJ3HADlgp6xnamk0D1DPH/Gu8IaWETgNF+9zta9rUpjvduSYCDstnPbQ==
X-Received: by 2002:ac8:5ac2:0:b0:4b4:906b:d05d with SMTP id d75a77b69052e-4eb92c5efbfmr144864781cf.29.1761575055300;
        Mon, 27 Oct 2025 07:24:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0e0246sm20252481fa.49.2025.10.27.07.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:24:14 -0700 (PDT)
Date: Mon, 27 Oct 2025 16:24:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v5 2/6] drm/panel: Add Samsung S6E3FC2X01 DDIC with
 AMS641RW panel
Message-ID: <62nvrszyslvmjwhsw2hrtqjny47o6eoz7wrixbgga5gpwjcorl@bhme3j25ywvs>
References: <20251023-s6e3fc2x01-v5-0-8f8852e67417@ixit.cz>
 <20251023-s6e3fc2x01-v5-2-8f8852e67417@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023-s6e3fc2x01-v5-2-8f8852e67417@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEzNCBTYWx0ZWRfX5m4R4ixvMbRb
 wPxZjRYR8CCmWnU3tjut2bqZR/m2vFdcTp52LAaL7O3gtnJrHEvPzI4/fMvpZrX0QV1Lw3HfHXb
 Qi2hLsK+Ttw6hdto+h6WSy/TRpH0c+pMyXFOcwkrU8oHLA7U+jdPLp6L/8r9tBYODd4gDIniDl3
 mT4r8T0PNuSQ5yqeCrXNHnnSrVOJeBEO8pCQHLmpYS4ZMhErQ4IM9dFiUQ7K1rWCKwGYeuX54Gw
 TOC6RC1gkgERqHsTG/Uz+fQLiQOkHMmUWz4LZn1TR1cUMNN/PGhSoAEqGtVRgFVKCLtVfJZNdl4
 XqwG7IAuyxMlZYCnB39Q4dQf6Oj6F4yjwlqhWI8S1Mja+F5lj5AURvC41MIzRY83+j+Yu0IkNaH
 EDgj6se0IkrpUVU3w2YSxKrNCJkwhQ==
X-Proofpoint-ORIG-GUID: IGWvxhJ97tQbXDPwMlQDOCurrLLdCng1
X-Proofpoint-GUID: IGWvxhJ97tQbXDPwMlQDOCurrLLdCng1
X-Authority-Analysis: v=2.4 cv=A6Jh/qWG c=1 sm=1 tr=0 ts=68ff8090 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=WFa1dZBpAAAA:8 a=bBqXziUQAAAA:8
 a=EUspDBNiAAAA:8 a=5iTMaUzIoB_AQxUztnYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=MZguhEFr_PtxzKXayD1K:22 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270134

On Thu, Oct 23, 2025 at 10:24:26PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add panel driver used in the OnePlus 6T.
> 
> No datasheet, based mostly on EDK2 init sequence and the downstream driver.
> 
> Note: This driver doesn't use previously mentioned "samsung,s6e3fc2x01"
> by OnePlus 6T device-tree.
> The reason is because DDIC itself without knowing the panel type used
> with it will not give the driver enough information about the panel used,
> as the panel cannot be autodetected.
> While would be more practical to support the original compatible,
> I would like to avoid it, to prevent confusing devs upstreaming DDICs.
> 
> Based on work of:
>   Casey Connolly <casey@connolly.tech>
>   Joel Selvaraj <foss@joelselvaraj.com>
>   Nia Espera <a5b6@riseup.net>
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  MAINTAINERS                                      |   1 +
>  drivers/gpu/drm/panel/Kconfig                    |  13 +
>  drivers/gpu/drm/panel/Makefile                   |   1 +
>  drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c | 385 +++++++++++++++++++++++
>  4 files changed, 400 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
